import 'package:flutter/material.dart';
import 'package:todo_app/taskmodels.dart';
import 'app_colors.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController task = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('New Task'), backgroundColor: LgT.appbar),
        backgroundColor: LgT.background,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: ListView(
                children: [
                  Text(
                    'What do you want to do today?',
                    style: TextStyle(color: LgT.txt, fontSize: 24),
                  ),
                  TextField(
                    maxLength: 30,
                    controller: task,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(24),
                      label: Text(
                        'enter task',
                        style: TextStyle(color: LgT.txt),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: datecontroller,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.date_range),
                        label: Text('Due date'),
                      ),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                            datecontroller.text = DateFormat(
                              'yyyy-MM-dd',
                            ).format(selectedDate!);
                            // print('date today is $selectedDate');
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: timecontroller,
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.watch_later_outlined),
                        label: Text('select time'),
                      ),
                      onTap: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                            timecontroller.text = selectedTime.format(context);
                            // print('date today is $pickedTime');
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: LgT.btn,
          child: Icon(Icons.done),
          onPressed: () {
            // print('task text ='+task.text);
            if (task.text.isEmpty ) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('please enter a task name')),
              );
              return;
            }
            // combine date and time into one
            final fullDateTime = DateTime(
              selectedDate!.year,
              selectedDate!.month,
              selectedDate!.day,
              selectedTime.hour,
              selectedTime.minute,
            );
            // ad to task lilst
            final newTask = Task(
              title: task.text.trim(),
              dateTime: fullDateTime,
               isCompleted: false);
            // Optional: Clear fields after adding
            task.clear();
            datecontroller.clear();
            timecontroller.clear();
            selectedDate = DateTime.now();
            selectedTime = TimeOfDay.now();
            Navigator.pop(context,newTask);
          },
        ),
      );
    
  }
}
