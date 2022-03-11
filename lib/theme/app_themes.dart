import 'package:flutter/material.dart';

class AppThemes{

  static Color colorPrimary = const Color(0xff319f60);

  static ThemeData appThemeLigth = ThemeData.light().copyWith(

    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black)
    ),

    scaffoldBackgroundColor: Colors.white,

    //MaterialButton
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15) 
      )
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(
          color: AppThemes.colorPrimary)
        ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.black12)
        )
    ),
  );
}