import 'dart:async';

import 'package:among_us_gdsc/core/geolocator_services.dart';
import 'package:among_us_gdsc/fetures/batch_allocation_screen/batch_allocation_imposter.dart';
import 'package:among_us_gdsc/fetures/batch_allocation_screen/batch_alocation_crewmate.dart';
import 'package:among_us_gdsc/firebase_options.dart';
import 'package:among_us_gdsc/main.dart';
import 'package:among_us_gdsc/services/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MaterialApp(
    home: Scaffold(
      body: WaitingScreen(),
    ),
  ));
}

class WaitingScreen extends StatefulWidget {
  const WaitingScreen({super.key});

  @override
  State<WaitingScreen> createState() => _WaitingScreenState();
}

class _WaitingScreenState extends State<WaitingScreen> {
  late GeolocatorServices geoservices;

  @override
  void initState() {
    geoservices = GeolocatorServices();
    Timer(
      Duration.zero,
      () async {
        location = await geoservices.determinePosition();
        print(location);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var gameStatusInstance = FirebaseFirestore.instance
        .collection("GameStatus")
        .doc("Status")
        .snapshots();
    return StreamBuilder(
      stream: gameStatusInstance,
      builder: (context, snapshot) {
        if (snapshot.data!["status"] == false) {
          return Stack(
            children: [
              Image.asset(
                "assets/Waiting screen1.png",
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                // Adjust the values below to position "Component 6.png" as desired
                left: -19, // Change this value to position horizontally
                top: 120, // Change this value to position vertically
                child: Image.asset(
                  "assets/Component 6.png",
                  height: 640, // Adjust the height as needed
                  fit: BoxFit.fitWidth,
                ),
              ),
              const Center(
                child: SizedBox(
                  height: 33,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.black,
                    color: Color.fromRGBO(75, 62, 26, 1),
                  ),
                ),
              )
            ],
          );
        } else {
          FirestoreServices()
              .isPlayerAliveImposter(FirebaseAuth.instance.currentUser!.email!)
              .then((value) {
            if (value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const BatchAllocationScreen()),
                  (route) => false);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (ctx) => const BatchAllocationCrewmateScreen()),
                  (route) => false);
            }
          });

          return Container();
        }
      },
    );
  }
}

void setTeamName(String email) async {
  String? teamName = (await FirestoreServices().getTeamNameByEmail(email));

  if (teamName == null) {
    GlobalteamName = "Null";
  } else {
    teamName = teamName;
  }
}
