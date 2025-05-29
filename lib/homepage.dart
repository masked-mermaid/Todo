import 'package:flutter/material.dart';
import 'tasksbanner.dart';
import 'compeleted_tasks.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        
        appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.primary,),
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
            DrawerHeader(
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary),
              child: const Text('Drawer Header'),
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
      );
  }
}