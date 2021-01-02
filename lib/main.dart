import 'package:flutter/material.dart';
import 'package:myapp/pages/MyHomePage.dart';

void main() {
  runApp(MaterialApp(home: MyHomePage(),debugShowCheckedModeBanner: false,
  theme:ThemeData(
    primaryColor: Color(0xFF3EBACE),
    accentColor: Color(0xFFD8ECF1),
    scaffoldBackgroundColor: Color(0xFFF3F5F7),
  ) ,

  ));
}

