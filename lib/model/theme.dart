import 'package:flutter/material.dart';

class Themes{
  List<ThemeData>_themes = [
    ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.blueGrey,
      brightness: Brightness.light,
      backgroundColor: Colors.blueGrey,
      accentColor: Colors.blueGrey,
      accentIconTheme: IconThemeData(color: Colors.cyan),
      dividerColor: Colors.blueGrey,
      iconTheme: IconThemeData(color: Colors.cyanAccent)
    ),
    ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: Colors.blueGrey,
      brightness: Brightness.dark,
      backgroundColor: const Color(0xFF212121),
      accentColor: Colors.pinkAccent,
      accentIconTheme: IconThemeData(color: Colors.black),
      dividerColor: Colors.pinkAccent,
      iconTheme: IconThemeData(color: Colors.pinkAccent)
    ),
  ];

  List<ThemeData> get getTheme =>_themes;

}