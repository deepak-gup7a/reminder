import 'package:flutter/material.dart';
import 'package:reminder/model/icons_list.dart';

class IconPicker extends StatelessWidget {
  final icons = iconList;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      alignment: WrapAlignment.center,
      children: <Widget>[
        for(var icon in icons)
          GestureDetector(
            onTap: ()=>Navigator.pop(context,icon),
            child: Icon(icon),
          )
      ],
    );
  }
}
