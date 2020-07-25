import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool isSwitch=false;
  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(
          "Reminded"
      ),
      actions: [
        Switch(
          value: isSwitch,
          onChanged: (value){
            setState(() {
              isSwitch = value;
              print(isSwitch);
            });
          },
        )
      ],
    );
  }
}

