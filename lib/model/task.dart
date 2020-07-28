
import 'package:flutter/material.dart';
import 'package:reminder/model/icons_list.dart';

class Task {
  IconData _leadingIcon;
  String _taskName;
  String _description;
  DateTime _taskDate;
  TimeOfDay _taskTime;

  Task(
    this._taskName,
    this._leadingIcon,
    this._description,
    this._taskDate,
    this._taskTime
  );

  Map<String ,dynamic>toMap(){
    return{
      'taskName':_taskName,
      'leadingIcon':iconList.indexOf(_leadingIcon),
      'description':_description,
      'taskDate' : _taskDate.toString(),
      'taskTime' : _taskTime.toString()
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

  set taskDate(DateTime date){
    this._taskDate = date;
  }

  set taskTime(TimeOfDay time){
    this._taskTime = time;
  }


  //getters
  String get taskName => this._taskName;

  String get description => this._description;

  IconData get leadingIcon => this._leadingIcon;

  DateTime get taskDate => this._taskDate;

  TimeOfDay get taskTime => this._taskTime;

}

