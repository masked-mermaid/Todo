import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/add_task.dart';
import 'app_colors.dart';


class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  bool? ischecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LgT.background,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>(AddTask())));
        }),

      body: ListView(
        children: [
          createTask('Do laundry'),
          createTask("Do pushup")],
      ),
    );
  }

  Widget createTask(String taskName) {
    var screenSize = MediaQuery.of(context).size;

    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 30),
        height: screenSize.height * .08,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          color: LgT.background,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(4,4),
              blurRadius: 10,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-3, -3),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: ischecked,
              onChanged: (newBool) {
                setState(() {
                  ischecked = newBool;
                });
              },
            ),
            Text(
              taskName,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: LgT.txt,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
