import 'dart:async';
import 'package:reminder/database/data.dart';
import 'package:reminder/model/task.dart';

class TaskBloc{

  Data data = Data();

  List<Task>_sampleTask = [];

   int get len=>_sampleTask.length;

  final _taskListController = StreamController<List<Task>>();
  final _taskAddController = StreamController<Task>();
  final _taskDeleteController = StreamController<Task>();

  Stream<List<Task>> get taskListStream => _taskListController.stream;
  StreamSink<List<Task>> get taskListSink => _taskListController.sink;

  StreamSink<Task> get taskAddSink => _taskAddController.sink;
  StreamSink<Task> get taskDeleteSink => _taskDeleteController.sink;

  intializeData()async{
    _sampleTask = await data.fetchData();
    taskListSink.add(_sampleTask);
    for(var k in _sampleTask)
      print(k.taskName);
  }

  TaskBloc(){
    _taskListController.add(_sampleTask);
    _taskAddController.stream.listen(_addNewTask);
    _taskDeleteController.stream.listen(_deleteGivenTask);
  }

  _addNewTask(Task task){
    _sampleTask.add(task);
    taskListSink.add(_sampleTask);
    _addToDataBase(task);
  }

  _deleteGivenTask(Task task){
    _sampleTask.remove(task);
    taskListSink.add(_sampleTask);
    _deleteFromDataBase(task);
  }

  _addToDataBase(Task task)async{
    await data.insertTask(task);
  }

  _deleteFromDataBase(Task task)async{
    await data.deleteTask(task);
  }

  void dispose(){
    _taskListController.close();
    _taskAddController.close();
    _taskDeleteController.close();
  }



}