import 'dart:async';
import 'package:flutter/material.dart';
import 'package:reminder/model/task.dart';

class TaskBloc{

  List<Task> _sampleTask = [
    Task(
         "Coding",
         Icon(Icons.code,color: Colors.purple,),
         true,
         "Coding is my only life"
    ),
    Task(
         "Market",
         Icon(Icons.shop,color: Colors.purple),
         true,
         "purchase vegetable from market (Home-Work)"
    ),
    Task(
         "Gaming",
         Icon(Icons.games,color: Colors.purple),
         false,
         "pubg match "
    ),
    Task(
         "study",
         Icon(Icons.school,color: Colors.purple),
         true,
         "college is still on fire"
    ),
    Task(
         "Movie",
         Icon(Icons.movie,color: Colors.purple,),
         false,
         "Entertainment is important"
    ),
  ];

  final _taskListController = StreamController<List<Task>>();
  final _taskAddController = StreamController<Task>();
  final _taskDeleteController = StreamController<Task>();

  Stream<List<Task>> get taskListStream => _taskListController.stream;
  StreamSink<List<Task>> get taskListSink => _taskListController.sink;

  StreamSink<Task> get taskAddSink => _taskAddController.sink;
  StreamSink<Task> get taskDeleteSink => _taskDeleteController.sink;

  TaskBloc(){
    _taskListController.add(_sampleTask);
    _taskAddController.stream.listen(_addNewTask);
    _taskDeleteController.stream.listen(_deleteGivenTask);
  }

  _addNewTask(Task task){
    _sampleTask.add(task);
    for(var sam in _sampleTask)
      print(sam.taskName);
    taskListSink.add(_sampleTask);
  }

  _deleteGivenTask(Task task){
    _sampleTask.remove(task);
    taskListSink.add(_sampleTask);
  }

  void dispose(){
    _taskListController.close();
    _taskAddController.close();
    _taskDeleteController.close();
  }

}