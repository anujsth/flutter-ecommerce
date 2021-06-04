import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class themeData {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      accentColor: Colors.black,
      buttonColor: Colors.black,
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme));

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      accentColor: Colors.white,
      canvasColor: Colors.grey[900],
      buttonColor: Colors.blue.shade900,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme));
}
