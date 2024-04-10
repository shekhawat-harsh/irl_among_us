import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tasks List',
      home: TasksScreen(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: const Color.fromRGBO(
              255, 249, 219, 1), // Set the color of the app bar
        ),
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
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
      appBar: AppBar(
        title: Text('Tasks List'),
      ),
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
                    style: TextStyle(
                      color: Colors.white, // Text color of the title
                      fontWeight: FontWeight.bold, // Font weight of the title
                    ),
                  ),
                  subtitle: Text(
                    tasks[index]['task'] ?? '',
                    style: TextStyle(
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
