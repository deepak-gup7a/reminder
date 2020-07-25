import 'package:flutter/material.dart';

class Task {
  Icon leadingIcon;
  String taskName;
  String description;
  bool isNotifiable;

  Task({
    this.description,
    this.isNotifiable,
    this.leadingIcon,
    this.taskName
  });
}

  List<Task> sampleTask = [
    Task(
      taskName: "Coding",
      leadingIcon: Icon(Icons.code,color: Colors.purple,),
      isNotifiable: true,
      description: "Coding is my only life"
    ),
    Task(
        taskName: "Market",
        leadingIcon: Icon(Icons.shop,color: Colors.purple),
        isNotifiable: true,
        description: "purchase vegetable from market (Home-Work)"
    ),
    Task(
        taskName: "Gaming",
        leadingIcon: Icon(Icons.games,color: Colors.purple),
        isNotifiable: false,
        description: "pubg match "
    ),
    Task(
        taskName: "study",
        leadingIcon: Icon(Icons.school,color: Colors.purple),
        isNotifiable: true,
        description: "college is still on fire"
    ),
    Task(
        taskName: "Movie",
        leadingIcon: Icon(Icons.movie,color: Colors.purple,),
        isNotifiable: false,
        description: "Entertainment is important"
    ),
  ];

