import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/add_task.dart';
import 'package:todo_app/taskmodels.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  late Box<Task> _taskBox;

  @override
  void initState() {
    super.initState();
    _taskBox = Hive.box('TaskBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTask()),
          );
          if (newTask != null) {
            _taskBox.add(newTask);
          }
        },
      ),
      body: ValueListenableBuilder<Box<Task>>(
        valueListenable: _taskBox.listenable(),
        builder: (context, box, _) {
          final tasks = box.values.toList();
          return tasks.isEmpty
              ? Center(child: Text('You have no task for now!'))
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final task = tasks[index];
                    // Pass the actual key from Hive for better practice
                    // If you don't have a unique ID in Task, you can use index too,
                    // but keyAt(index) is more robust for Hive.
                    return createTask(task, index, box.keyAt(index));
                  },
                );
        },
      ),
    );
  }

  // Modified createTask to accept the Hive key as well
  Widget createTask(Task task, int index, dynamic hiveKey) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: Dismissible(
        // Use a ValueKey with the Hive key for a truly unique and robust key.
        // This is crucial for Dismissible to work correctly, especially when items are reordered or deleted.
        key: ValueKey(hiveKey),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          final Task dismissedTask = task; // Store the task itself
          final int dismissedIndex = index; // Store the original index
          final dynamic dismissedKey = hiveKey; // Store the original Hive key

          // Immediately delete from the Hive box.
          // The ValueListenableBuilder will then automatically rebuild the ListView,
          // removing the item from the UI. You don't need a `setState` here
          // directly affecting a local list, because Hive's listenable handles it.
          _taskBox.delete(dismissedKey); // Use the key for deletion

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 5),
              content: Text('Deleted task "${dismissedTask.title}"'), // Show which task was deleted
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {
                  // When UNDO is pressed, put the task back into the box
                  // at its original key. This will also trigger the ValueListenableBuilder
                  // to rebuild and show the task again.
                  _taskBox.put(dismissedKey, dismissedTask);
                },
              ),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 30),
          height: screenSize.height * .08,
          width: screenSize.width * 0.9,
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: Theme.of(context).brightness == Brightness.light
                ? [
                    BoxShadow(
                      color: const Color.fromARGB(255, 126, 126, 126),
                      offset: Offset(3, 3),
                      blurRadius: 8,
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-3, -3),
                      blurRadius: 8,
                    ),
                  ]
                : [
                    BoxShadow(
                      color: const Color.fromARGB(255, 48, 48, 48),
                      offset: Offset(-3, -3),
                      blurRadius: 2,
                    ),
                    BoxShadow(
                      color: const Color.fromARGB(255, 5, 5, 5),
                      offset: Offset(3, 3),
                      blurRadius: 5,
                    ),
                  ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: task.isCompleted,
                onChanged: (newBool) {
                  setState(() {
                    task.isCompleted = newBool!;
                    // When updating, put using the Hive key
                    _taskBox.put(hiveKey, task);
                  });
                },
              ),
              Text(
                task.title,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.all(5), child: Text('$index')),
            ],
          ),
        ),
      ),
    );
  }
}