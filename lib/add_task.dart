import 'package:flutter/material.dart';
import 'app_colors.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: LgT.background,
      appBar: AppBar(backgroundColor: LgT.appbar,
      title: Title(color: Colors.black, child: Text('addtask')),),
      body: TextField(),
    );
  }
}