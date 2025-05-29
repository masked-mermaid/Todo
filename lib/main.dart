import 'package:flutter/material.dart';
import 'package:todo_app/theme.dart';
import 'homepage.dart';
import 'taskmodels.dart';

import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
    await Hive.openBox<Task>('TaskBox');

  // var box= await Hive.openBox('taskBox');
  runApp(const ToDo());
}

class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode ,
      darkTheme: darkMode,
      themeMode: ThemeMode.system,
      home:Homepage(),
    );
  }
}
