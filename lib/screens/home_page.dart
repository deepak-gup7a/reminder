import 'package:flutter/material.dart';
import 'package:reminder/bloc/task_bloc.dart';
import 'package:reminder/model/task.dart';
import 'package:reminder/screens/new_task.dart';
import 'package:reminder/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final TaskBloc taskBloc = TaskBloc() ;

  @override
  void dispose() {
    taskBloc.dispose();
    super.dispose();
  }


  _addTask(Task task){
    taskBloc.taskAddSink.add(task);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
          child: HomeAppBar()
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()async{
          Task task = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>AddNewTask())
          );
          _addTask(task);
        },
      ),

      body: StreamBuilder(
        stream: taskBloc.taskListStream,
        builder:(context,snapshot)=> ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context,index){
              Task task = snapshot.data[index];
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: ListTile(
                    leading: task.leadingIcon,
                    title: Text(task.taskName),
                    subtitle: Text(task.description),
                    trailing: Icon(task.isNotifiable?Icons.notifications_active:Icons.notifications,),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}
