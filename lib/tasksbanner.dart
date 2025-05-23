// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:todo_app/add_task.dart';
// import 'package:todo_app/taskmodels.dart';
// import 'app_colors.dart';

// class ToDoScreen extends StatefulWidget {
//   const ToDoScreen({super.key});

//   @override
//   State<ToDoScreen> createState() => _ToDoScreenState();
// }

// class _ToDoScreenState extends State<ToDoScreen> {
//   // bool? ischecked = false;
//   List<Task> tasklist = [];
//   List<Task> get pendingTask => tasklist.where((t) => !t.isCompleted).toList();
//   List<Task> get completetask => tasklist.where((t) => t.isCompleted).toList();
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       backgroundColor: LgT.background,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: LgT.btn,
//         child: Icon(Icons.add),
//         onPressed: () async {
//           final newTask = await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => AddTask()),
//           );
//           if (newTask != null) {
//             setState(() {
//               tasklist.add(newTask);
//             });
//           }
//         },
//       ),

//       body:
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [SizedBox(
//               height:screenSize.height*0.4,
//               width: screenSize.width*0.8,
//               child:pendingTask.isEmpty
//               ? Center(child: Text('You have no task for now!'))
//               : ListView.builder(
//                 itemCount: pendingTask.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final task = tasklist[index];
//                   return createTask(task, index);
//                 },
//               ),
              
//             ),
//             SizedBox(
//               height:screenSize.height*0.4,
//               width: screenSize.width*0.8,
//               child:completetask.isEmpty
//               ? Center(child: Text('You have no task for now!'))
//               : ListView.builder(
//                 itemCount: pendingTask.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final task = tasklist[index];
//                   return deleteTask(task, index);
//                 },
//               ),)
//           ])
//     );
//   }

//   Widget createTask(Task task, int index) {
//     var screenSize = MediaQuery.of(context).size;

//     return 
//        Container(
//         margin: EdgeInsets.only(top: 30),
//         height: screenSize.height * .08,
//         width: screenSize.width * 0.9,
//         decoration: BoxDecoration(
//           color: LgT.background,
//           borderRadius: BorderRadius.all(Radius.circular(8)),
//           boxShadow: [
//             BoxShadow(
//               color: const Color.fromARGB(255, 126, 126, 126),
//               offset: Offset(3, 3),
//               blurRadius: 8,
//             ),
//             BoxShadow(
//               color: Colors.white,
//               offset: Offset(-3, -3),
//               blurRadius: 8,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Checkbox(
//               value: task.isCompleted,
//               onChanged: (newBool) {
//                 setState(() {
//                   tasklist[index].isCompleted = newBool!;
                 
//                 });
//               },
//             ),
//             Text(
//               task.title,
//               style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w400,
//                 color: LgT.txt,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             Padding(padding: EdgeInsets.all(5), child: Text('$index')),
//           ],
//         ),
//       );
//   }
//   Widget deleteTask(Task task, int index) {
//     var screenSize = MediaQuery.of(context).size;

//     return Container( margin: EdgeInsets.only(top: 30),
//         height: screenSize.height * .08,
//         width: screenSize.width * 0.9,
//         decoration: BoxDecoration(
//           color: LgT.background,
//           borderRadius: BorderRadius.all(Radius.circular(8)),
//           boxShadow: [
//             BoxShadow(
//               color: const Color.fromARGB(255, 126, 126, 126),
//               offset: Offset(3, 3),
//               blurRadius: 8,
//             ),
//             BoxShadow(
//               color: Colors.white,
//               offset: Offset(-3, -3),
//               blurRadius: 8,
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Checkbox(
//               value: !task.isCompleted,
//               onChanged: (newBool) {
//                 setState(() {
//                   tasklist[index].isCompleted = newBool!;
                 
//                 });
//               },
//             ),
//             Text(
//               task.title,
//               style: GoogleFonts.poppins(
//                 fontSize: 22,
//                 fontWeight: FontWeight.w400,
//                 color: LgT.txt,
//                 decoration: TextDecoration.lineThrough
//               ),
//               textAlign: TextAlign.center,
              
//             ),
//             Padding(padding: EdgeInsets.all(5), child: Text('$index')),
//           ],
//         ),

//     );
// }
// }
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/add_task.dart';
import 'package:todo_app/taskmodels.dart';
import 'app_colors.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  // bool? ischecked = false;
  List<Task> tasklist = [];
  List<Task> get pendingTask => tasklist.where((t) => !t.isCompleted).toList();
  List<Task> get completetask => tasklist.where((t) => t.isCompleted).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LgT.background,
      floatingActionButton: FloatingActionButton(
        backgroundColor: LgT.btn,
        child: Icon(Icons.add),
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTask()),
          );
          if (newTask != null) {
            setState(() {
              tasklist.add(newTask);
            });
          }
        },
      ),

      body:
          tasklist.isEmpty
              ? Center(child: Text('You have no task for now!'))
              : ListView.builder(
                itemCount: pendingTask.length,
                itemBuilder: (BuildContext context, int index) {
                  final task = tasklist[index];
                  return createTask(task, index);
                },
              ),
    );
  }

  Widget createTask(Task task, int index) {
    var screenSize = MediaQuery.of(context).size;

    return ListView(
       children: [
       Container(
        margin: EdgeInsets.only(top: 30),
        height: screenSize.height * .08,
        width: screenSize.width * 0.9,
        decoration: BoxDecoration(
          color: LgT.background,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
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
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              value: task.isCompleted,
              onChanged: (newBool) {
                setState(() {
                  tasklist[index].isCompleted = newBool!;
                 
                });
              },
            ),
            Text(
              task.title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                color: LgT.txt,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(5), child: Text('$index')),
          ],
        ),
      ),
      SizedBox(
        height: screenSize.height*.8,
        width: screenSize.width*0.8,
        child: ListView.builder(
          itemCount: completetask.length,
          itemBuilder: (BuildContext context, int index) {
            final task = completetask[index];
            return createTask(task, index);
          },
        ),
      ),
      completetask.isNotEmpty
          ? SizedBox(
          height: screenSize.height * .8,
          width: screenSize.width * 0.8,
          child: ListView.builder(
            itemCount: completetask.length,
            itemBuilder: (BuildContext context, int index) {
          final task = completetask[index];
          return createTask(task, index);
            },
          ),
        )
          : Center(child: Text('No complete task')),
    ]);
  }
}


