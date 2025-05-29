import 'package:flutter/material.dart';

ThemeData lightMode=ThemeData(
      // Color neumorphicTop= Colors.white,

  scaffoldBackgroundColor: Color(0xFFE2E2E7),
    brightness: Brightness.light,
    useMaterial3: true,

    colorScheme: ColorScheme.light(
      primary: Color(0xF5868DE9),
      secondary: Color.fromARGB(220, 157, 250, 154),
      
      
      
    )

);

ThemeData darkMode = ThemeData(
  scaffoldBackgroundColor: Color.fromARGB(255, 22, 22, 25),
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
     primary: Color.fromARGB(245, 40, 42, 70),
      secondary: Color.fromARGB(255, 51, 82, 82),
      

  )
);