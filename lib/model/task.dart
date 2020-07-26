
import 'package:flutter/material.dart';

class Task {
  Icon _leadingIcon;
  String _taskName;
  String _description;
  bool _isNotifiable;

  Task(
    this._taskName,
    this._leadingIcon,
    this._isNotifiable,
    this._description,
  );

  //setters
  set leadingIcon(Icon icon){
    this._leadingIcon = icon;
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

  Icon get leadingIcon =>this._leadingIcon;

  bool get isNotifiable =>this._isNotifiable;

}

