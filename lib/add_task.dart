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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: LgT.background,
        body: SafeArea(
          child: Center(
            child: Container(
              color: LgT.background,
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView(
                children: [
                  Text(
                    'What do you want to do today?',
                    style: TextStyle(color: LgT.txt, fontSize: 24),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(24),
                      label: Text(
                        'enter task',
                        style: TextStyle(color: LgT.txt),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),

                        // labelStyle: TextStyle(color: LgT.txt, fontSize: 24),
                      ),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: TextEditingController(),
                      readOnly: true,

                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        label: Text('enter date'),
                        hintText: 'Date not set',
                      ),
                      onTap:
                          () => showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          ),
                    ),
                  ),

                  ElevatedButton(
                    onPressed:
                        () => showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ),
                    child: Text('pick time'),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.done),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget pickDate() {
    return DatePickerDialog(
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
    );
  }

  Widget picktime() {
    return TimePickerDialog(initialTime: TimeOfDay.now());
  }
}
