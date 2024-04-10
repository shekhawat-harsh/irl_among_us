import 'package:flutter/material.dart';

class TasksScreen2 extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {'task': 'Pnc Password Game', 'location': 'Audi'},
    {'task': 'Align Mirrors', 'location': 'CB'},
    {'task': 'Tower of Hanoi', 'location': 'OAT'},
    {'task': 'Icebreakers', 'location': '4H'},
    {'task': 'Space Wars', 'location': 'EC dept'},
    {'task': 'Hill Climb', 'location': 'Open Air Gym'},
    {'task': 'Dumb Charades', 'location': 'Sp doc'},
    {'task': 'Breadboard Circuit', 'location': 'Admin Block'},
    {'task': 'Hurdles', 'location': 'LH'},
    {'task': 'Brick Crossing', 'location': 'SAC'}
  ];

  TasksScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromRGBO(
            255, 249, 219, 1), // Background color of the screen
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Card(
                color: const Color.fromARGB(
                    255, 140, 130, 98), // Background color of the card
                elevation: 4, // Card elevation
                child: ListTile(
                  title: Text(
                    tasks[index]['location'] ?? '',
                    style: const TextStyle(
                      color: Colors.white, // Text color of the title
                      fontWeight: FontWeight.bold, // Font weight of the title
                    ),
                  ),
                  subtitle: Text(
                    tasks[index]['task'] ?? '',
                    style: const TextStyle(
                      color: Colors.white, // Text color of the subtitle
                      fontWeight:
                          FontWeight.normal, // Font weight of the subtitle
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
