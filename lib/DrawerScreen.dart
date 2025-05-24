import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'compeleted_tasks.dart';

class Drawerscreen extends StatelessWidget {
  const Drawerscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const CompletedTasks()));
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
}
