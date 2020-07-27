import 'package:flutter/material.dart';
import 'package:reminder/bloc/task_bloc.dart';
import 'package:reminder/model/task.dart';
import 'package:reminder/screens/new_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final TaskBloc taskBloc = TaskBloc() ;

    @override
  void initState() {
      super.initState();
      taskBloc.intializeData();
  }

  @override
  void dispose() {
    taskBloc.dispose();
    super.dispose();
  }


  _addTask(Task task){
    taskBloc.taskAddSink.add(task);
  }

  Future<bool>_showAskDialog(BuildContext context)async{
    return showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Are you sure ?? "),
        actions: <Widget>[
          RaisedButton(
            child: Text("yes"),
            onPressed: ()=>Navigator.pop(context,true),
          ),
          RaisedButton(
            child: Text("no"),
            onPressed: ()=>Navigator.pop(context,false),
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()async{
          Task task = await Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>AddNewTask())
          );
          if(task!=null)
          _addTask(task);
        },
      ),

      body: taskBloc.len!=null?StreamBuilder(
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
                child: Dismissible(
                  background: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(Icons.delete,color: Colors.red,),
                    ),
                  ),
                  direction: DismissDirection.startToEnd,
                  key: ValueKey(task),
                  onDismissed: (direction)=>taskBloc.taskDeleteSink.add(task),
                  confirmDismiss: (direction)=>_showAskDialog(context),
                  child: Container(
                    child: ListTile(
                      leading: Icon(task.leadingIcon),
                      title: Text(task.taskName),
                      subtitle: Text(task.description),
                      trailing: Icon(task.isNotifiable?Icons.notifications_active:Icons.notifications,),
                    ),
                  ),
                ),
                  ),
              );
            }
        ),
      ):Center(child: Container(color: Colors.red,),),
    );
  }
}
