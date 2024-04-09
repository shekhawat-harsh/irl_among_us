import 'package:flutter/material.dart';

void main(List<String> args) async {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]);
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const MaterialApp(
    home: Scaffold(
      body: DeathScreen(),
    ),
  ));
}

class DeathScreen extends StatelessWidget {
  const DeathScreen({super.key});

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
                "assets/dead.gif",
                height: 200,
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
