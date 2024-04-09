import 'dart:async';
import 'package:among_us_gdsc/fetures/home/home_screen.dart';
import 'package:among_us_gdsc/main.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: BatchAllocationScreen(),
  ));
}

class BatchAllocationScreen extends StatefulWidget {
  const BatchAllocationScreen({Key? key}) : super(key: key);

  @override
  _BatchAllocationScreenState createState() => _BatchAllocationScreenState();
}

class _BatchAllocationScreenState extends State<BatchAllocationScreen> {
  int _countdown = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer.cancel();
          // Navigate to HomeScreen after countdown
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => HomeScreen(
                teamName: GlobalteamName,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 249, 219, 1),
        body: Stack(
          children: [
            Positioned(
              // Adjust the values below to position "Component 6.png" as desired
              left: -25, // Change this value to position horizontally
              top: 120, // Change this value to position vertically
              child: Image.asset(
                "assets/Component 7.png",
                height: 640, // Adjust the height as needed
                fit: BoxFit.fitWidth,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircularProgressIndicator(), // Display circular progress indicator
                  const SizedBox(height: 20),
                  Text(
                    '$_countdown', // Show countdown value
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(110, 97, 62, 1),
                    ),
                  ),
                  const Text(
                    'You are an Imposter !!', // Show countdown value
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(110, 97, 62, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
