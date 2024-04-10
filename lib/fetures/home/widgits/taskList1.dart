import 'package:flutter/material.dart';

class TasksScreen1 extends StatefulWidget {
  const TasksScreen1({Key? key}) : super(key: key);

  @override
  State<TasksScreen1> createState() => _TasksScreen1State();
}

class _TasksScreen1State extends State<TasksScreen1> {
  final List<Map<String, String>> tasks = [
    {'task': 'Image Puzzle', 'location': 'Audi'},
    {'task': 'Minefield', 'location': 'CB'},
    {'task': 'Hangman', 'location': 'OAT'},
    {'task': 'Scribble', 'location': '4H'},
    {'task': 'Space Wars', 'location': 'EC dept'},
    {'task': 'Cham Cham Cham', 'location': 'Open Air Gym'},
    {'task': 'Flying Per', 'location': 'Sp doc'},
    {'task': 'Code Blocks', 'location': 'Admin Block'},
    {'task': 'Ball Game', 'location': 'LH'},
    {'task': 'Connect 4', 'location': 'SAC'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: tasks
                    .map((task) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Card(
                            color: const Color.fromARGB(255, 140, 130,
                                98), // Background color of the card
                            elevation: 4, // Card elevation
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    task['location'] ?? '',
                                    style: const TextStyle(
                                      color: Colors
                                          .white, // Text color of the location
                                      fontWeight: FontWeight
                                          .bold, // Font weight of the location
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    task['task'] ?? '',
                                    style: const TextStyle(
                                      color: Colors
                                          .white, // Text color of the task
                                      fontWeight: FontWeight
                                          .normal, // Font weight of the task
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
