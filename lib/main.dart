import 'package:flutter/material.dart';
import 'package:reminder/screens/home_page.dart';
import 'model/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main()=>runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSwitch = false;
  Themes theme = Themes();

  getInitialTheme()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isSwitch = prefs.getBool('ISDARK');
  }

  setTheme()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('ISDARK', isSwitch);
  }

  @override
  void dispose() {
    setTheme();
    super.dispose();
  }

  @override
  void initState() {
    getInitialTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:  false,
      theme: isSwitch?theme.getTheme[1]:theme.getTheme[0],
      home: Scaffold(
        appBar: AppBar(
          title: Text("Reminded"),
          actions: <Widget>[
            Switch(
              value: isSwitch,
              onChanged: (value){
                setState(() {
                  isSwitch = value;
                });
              },
            )
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}
