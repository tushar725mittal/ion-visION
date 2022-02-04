import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        accentColor: darkbluishColor,
        buttonColor: darkbluishColor,
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        titleTextStyle: TextStyle(color: Colors.black),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        buttonColor: lightbluishColor,
        accentColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
        color: Colors.white,
        ),
        )
      );

      //Colors
      static Color creamColor = Color(0xfff5f5f5);
      static Color darkcreamColor = Vx.gray900;
      static Color darkbluishColor = Color(0xff403b58);
      static Color lightbluishColor = Vx.indigo500;
}