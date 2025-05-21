import 'package:flutter/material.dart';
import 'tasksbanner.dart';
import 'app_colors.dart';
void main() {
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: LgT.appbar),
        body: ToDoScreen(),
      ),
    );
  }
}
