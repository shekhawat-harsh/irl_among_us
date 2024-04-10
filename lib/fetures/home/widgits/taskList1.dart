import 'package:flutter/material.dart';

void main() {
  runApp(const TaskList1());
}

class TaskList1 extends StatelessWidget {
  const TaskList1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Scroll Down View',
      home: ScrollDownScreen(),
    );
  }
}

class ScrollDownScreen extends StatelessWidget {
  const ScrollDownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100, // Change this to the number of items you want
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
