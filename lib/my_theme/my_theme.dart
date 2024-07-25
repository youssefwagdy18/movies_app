import 'package:flutter/material.dart';

class MyTheme{
  static const Color primaryGreyColor =Color(0xff282A28);
  static const Color blackLightColor =Color(0xff1A1A1A);
  static const Color lightGreyColor =Color(0xffC6C6C6);
  static const Color selectedTabColor =Color(0xffFFBB3B);
  static ThemeData darkMode = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Color(0xff1D1E1D)
        ,centerTitle: true
        ,iconTheme: IconThemeData(color:  Color(0xff1D1E1D))),
    textTheme: const TextTheme(titleMedium: TextStyle(color: Color(0xffFFFFFF),
        fontSize: 18,fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),
    titleLarge: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Color(0xffFFFFFF)),
    ),
    scaffoldBackgroundColor: const Color(0xff121312),
  );
}

