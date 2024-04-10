import 'package:flutter/material.dart';

void main() {
  runApp(TaskList1());
}

class TaskList1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scroll Down View',
      home: ScrollDownScreen(),
    );
  }
}

class ScrollDownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Down View'),
      ),
      body: ListView.builder(
        itemCount: 100, // Change this to the number of items you want
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index'),
          );
        },
      ),
    );
  }
}
