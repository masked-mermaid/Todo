import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});
  

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
  
}

class _ToDoScreenState extends State<ToDoScreen> {
        bool?ischecked=true;
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: LgT.background,
      floatingActionButton: FloatingActionButton(onPressed: () => context,
      
      ),

        
        body: ListView(
          children: [
            createTask('do laundry'),
            createTask("do pushup")

          ],
        ),
      );
    
  }

Widget createTask( String taskName){
        var screenSize = MediaQuery.of(context).size;

  return Center(
    child: Container(
      margin: EdgeInsets.only(top: 38,),
      height: screenSize.height*.1,
      width: screenSize.width*0.9,
      decoration: BoxDecoration(
      color: LgT.background,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5,5),
          blurRadius: 10,
          
        ),BoxShadow(
          color: Colors.white,
          offset: Offset(-5, -5),
          blurRadius: 10,
          
        )
      ]
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(value: ischecked, onChanged: (newBool){
            setState(() {
              ischecked=newBool;
            });
          }),
          Text(
            '$taskName',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: LgT.txt,
            ),
            textAlign:TextAlign.center,
             

          )

        ],
      ),
    ),
  );


  

}

}