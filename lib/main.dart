import 'package:flutter/material.dart';
import 'package:reminder/screens/home_page.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
//      theme: ThemeData(
//        primarySwatch: Colors.purple,
//      ),
      title: "Remind me",
      home:HomePage(),
    );
  }
}
