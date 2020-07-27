import 'package:flutter/material.dart';
import 'package:reminder/screens/home_page.dart';
import 'package:reminder/theme.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Themes theme = Themes();
    return StreamBuilder(
      stream: ,
      builder:(context,snapshot)=> MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.darkTheme,
        home: HomePage(),
      ),
    );
  }
}

