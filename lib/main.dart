import 'package:flutter/material.dart';
import 'tasksbanner.dart';
import 'app_colors.dart';
import 'compeleted_tasks.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  var box= await Hive.openBox('taskBox');
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
         drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child:Builder(
          builder: (context) {
            return ListView(
                  padding: EdgeInsets.zero,
                  children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('completed tasks'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CompletedTasks()));
                // Update the state of the app.
                // ...
              },
            ),
            
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
                  ],
                );
          }
        )
      ),
      ),
    );
  }
}
