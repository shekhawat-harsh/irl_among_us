import 'package:among_us_gdsc/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DeathScreen extends StatefulWidget {
  const DeathScreen({super.key});

  @override
  State<DeathScreen> createState() => _DeathScreenState();
}

class _DeathScreenState extends State<DeathScreen> {
  @override
  void initState() {
    removeLocationForTeam(GlobalteamName);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Positioned(
              // Adjust the values below to position "Component 6.png" as desired
              left: -25, // Change this value to position horizontally
              top: 120, // Change this value to position vertically
              child: Image.asset(
                "assets/dead screen bg.png",
                height: 640, // Adjust the height as needed
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Image.asset(
                "assets/among us kill2.png",
                height: 350,
              ),
            ),
            // const Positioned(
            //   left: 83,
            //   top: 700,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       Text(
            //         'You are dead...',
            //         style: TextStyle(
            //           fontSize: 38,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ));
  }
}

void removeLocationForTeam(String teamId) async {
  try {
    // Get a reference to the Firebase Realtime Database
    DatabaseReference databaseRef = FirebaseDatabase.instance.ref();

    // Construct the path to the location entry for the specified teamId
    String path = 'location/$teamId';

    // Remove the location entry from the database
    await databaseRef.child(path).remove();

    print('Location removed successfully for team with ID: $teamId');
  } catch (e) {
    print('Error removing location for team with ID $teamId: $e');
    // Handle error appropriately (e.g., show error message)
  }
}
