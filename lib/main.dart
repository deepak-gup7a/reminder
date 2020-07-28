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
   var theme = new Themes();

  getInitialTheme()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('ISDARK')!=null)
    setState(() {
      isSwitch = prefs.getBool('ISDARK');
    });
  }

  setTheme()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getKeys());
    prefs.setBool('ISDARK', isSwitch);
  }


  @override
  void initState() {
    getInitialTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
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
                  setTheme();
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
