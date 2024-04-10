import 'dart:async';

import 'package:among_us_gdsc/core/geolocator_services.dart';
import 'package:among_us_gdsc/fetures/batch_allocation_screen/batch_allocation_imposter.dart';
import 'package:among_us_gdsc/fetures/batch_allocation_screen/batch_alocation_crewmate.dart';
import 'package:among_us_gdsc/main.dart';
import 'package:among_us_gdsc/services/firestore_services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    Timer(const Duration(seconds: 0), () async {
      play;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

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
                  width: screenWidth,
                  height: screenHeight,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: screenWidth * 0.05,
                  top: screenHeight * 0.2,
                  child: Image.asset(
                    "assets/Component 6.png",
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.6,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.4,
                  top: screenHeight * 0.5,
                  child: Image.asset(
                    'assets/among-us-twerk.gif',
                    height: screenHeight * 0.15,
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.2,
                  right: screenWidth * 0.2,
                  bottom: screenHeight * 0.4,
                  child: Text(
                    "Waiting for GDSC to start the game",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 18 : 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(110, 97, 62, 1),
                    ),
                  ),
                ),
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
