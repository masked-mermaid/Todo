import 'package:flutter/material.dart';


class CompletedTasks extends StatefulWidget {
  const CompletedTasks({super.key});

  @override
  State<CompletedTasks> createState() => _CompletedTaskState();
}

class _CompletedTaskState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text('hi'),
      ),
    );
  }
}