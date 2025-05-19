import 'package:flutter/material.dart';
import 'app_colors.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime= TimeOfDay.now();
                              bool selectTime= false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,

      home: Scaffold(
        
        appBar: AppBar(title: Text('New Task'),
        backgroundColor: LgT.appbar,
       
        ),
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
                        hintText: '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                        
                      ),
                      onTap:
                          () async{
                            DateTime? date = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (date!=null){
                            setState(() {
                              selectedDate=date;
                              print('date today is $selectedDate');
                              selectTime= true;
                            });
                          }}
                    ),
                  ),
                  Visibility(
                    visible: selectTime,
                    child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextFormField(
                      controller: TextEditingController(),
                      readOnly: true,

                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.watch_later_outlined),
                        label: Text('select time'),
                        hintText: '${selectedTime.hour}:${selectedTime.minute}',
                        
                      ),
                      onTap:
                          () async{
                            TimeOfDay? time= await showTimePicker(
                            context: context,
                           initialTime: TimeOfDay.now()
                          );
                          if (time!=null){
                            setState(() {
                              selectedTime=time;
                              print('date today is $time');
                            });
                          }}
                    ),
                  ),),

                 
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

}
