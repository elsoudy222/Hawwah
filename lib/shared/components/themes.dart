import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hexcolor/hexcolor.dart';

final ThemeData lightMode = ThemeData(
  primarySwatch: Colors.pink,
    appBarTheme: AppBarTheme(
      backgroundColor: secondaryColor,
      elevation: 3.0,
      iconTheme: IconThemeData(
        color: thirdColor,
      ),
      titleTextStyle: TextStyle(
        color: thirdColor ,
        fontSize: 30.0,
        fontFamily: 'Barada',
      )
    ),
    // scaffoldBackgroundColor:  primaryColor,
    fontFamily: 'Barada',
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:secondaryColor,
      elevation: 30.0,
      type: BottomNavigationBarType.fixed,
    ),

);