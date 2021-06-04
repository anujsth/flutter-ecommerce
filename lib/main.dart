import 'package:flutter/material.dart';
import 'package:practive/pages/cart.dart';
import 'package:practive/pages/home_detail_page.dart';
import 'package:practive/pages/login.dart';
import 'package:practive/pages/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practive/widgets/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: themeData.lightTheme(context),
      darkTheme: themeData.darkTheme(context),
      routes: {
        '/': (context) => Login(),
        '/home': (context) => HomePage(),
        '/DetailPage': (context) => DetailPage(),
        '/CartPage': (context) => CartPage(),
      },
    );
  }
}
