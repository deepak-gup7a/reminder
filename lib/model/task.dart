
import 'package:flutter/material.dart';
import 'package:reminder/model/icons_list.dart';

class Task {
  IconData _leadingIcon;
  String _taskName;
  String _description;
  bool _isNotifiable;

  Task(
    this._taskName,
    this._leadingIcon,
    this._isNotifiable,
    this._description,
  );

  Map<String ,dynamic>toMap(){
    return{
      'taskName':_taskName,
      'leadingIcon':iconList.indexOf(_leadingIcon),
      'isNotifiable':_isNotifiable.toString(),
      'description':_description
    };
  }

  //setters
  set leadingIcon(IconData iconData){
    this._leadingIcon = iconData;
  }

  set description(String desc){
    this._description = desc;
  }

  set taskName(String name){
    this._taskName = name;
  }

  set isNotifiable(bool isIt){
    this._isNotifiable = isIt;
  }


  //getters
  String get taskName=>this._taskName;

  String get description => this._description;

  IconData get leadingIcon =>this._leadingIcon;

  bool get isNotifiable =>this._isNotifiable;

}

