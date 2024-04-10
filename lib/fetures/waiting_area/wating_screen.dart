import 'dart:async';

import 'package:among_us_gdsc/core/geolocator_services.dart';
import 'package:among_us_gdsc/fetures/batch_allocation_screen/batch_allocation_imposter.dart';
import 'package:among_us_gdsc/fetures/batch_allocation_screen/batch_alocation_crewmate.dart';
import 'package:among_us_gdsc/firebase_options.dart';
import 'package:among_us_gdsc/main.dart';
import 'package:among_us_gdsc/services/firestore_services.dart';
import 'package:audioplayers/audioplayers.dart';
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
  final AudioPlayer _audioPlayer = AudioPlayer();

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
    _playAudio();
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio() async {
    var play = await _audioPlayer.play(AssetSource('waiting.mp3'));
    Timer(const Duration(seconds: 72), () async {
      play;
    });
  }

  @override
  Widget build(BuildContext context) {
    var gameStatusInstance = FirebaseFirestore.instance
        .collection("GameStatus")
        .doc("Status")
        .snapshots();
    return Scaffold(
      body: StreamBuilder(
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
                Positioned(
                  left: 134,
                  top: 310,
                  child: Image.asset(
                    'assets/among-us-twerk.gif',
                    height: 120,
                  ),
                ),
                const Positioned(
                    left: 100,
                    right: 70,
                    bottom: 300,
                    child: Text(
                      "Waiting for GDSC to start the game",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(110, 97, 62, 1),
                      ),
                    )),
              ],
            );
          } else {
            FirestoreServices()
                .isPlayerAliveImposter(
                    FirebaseAuth.instance.currentUser!.email!)
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
                        builder: (ctx) =>
                            const BatchAllocationCrewmateScreen()),
                    (route) => false);
              }
            });

            return Container();
          }
        },
      ),
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
