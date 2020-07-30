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
        contentPadding: EdgeInsets.all(0.0),
        buttonPadding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
          ),
        title: Text("Are you sure ?? "),
        actions: <Widget>[
          RaisedButton(
            splashColor: Colors.green,
            color: Colors.brown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold),),
            onPressed: ()=>Navigator.pop(context,true),
          ),
          RaisedButton(
            splashColor: Colors.red,
            color: Colors.brown,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
            ),
            child: Text("No",style: TextStyle(fontWeight: FontWeight.bold),),
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

      body: taskBloc.len!=null?StreamBuilder<List<Task>>(
        stream: taskBloc.taskListStream,
        builder:(BuildContext context,AsyncSnapshot<List<Task>>snapshot)=> ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context,int index){
              Task task = snapshot.data[index];
              return Column(
                children: <Widget>[
                  Container(
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: Dismissible(
                    background: Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 15.0,right: 15.0),
                              child: Icon(Icons.delete,color: Colors.red[500],)
                          ),
                          Text("swipe to delete",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                    direction: DismissDirection.startToEnd,
                    key: ValueKey(task),
                    onDismissed: (direction)=>taskBloc.taskDeleteSink.add(task),
                    confirmDismiss: (direction)=>_showAskDialog(context),
                    child: Container(
                      child: ListTile(
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(task.leadingIcon,size: 35.0,),
                            SizedBox(width: 5.0,),
                            Text("|",style: TextStyle(fontSize: 45.0,))
                          ],
                        ),
                        title: Text(task.taskName),
                        subtitle: Text(task.description),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.only(left: 15,right: 15,top: 3.0,bottom: 3.0),
                          child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.start,
                            alignment: WrapAlignment.end,
                            direction: Axis.vertical,
                            children: <Widget>[
                              Text(task.taskDate.toString().split(" ")[0],style: TextStyle(color: Colors.white),),
                              SizedBox(height: 3.0,),
                              Text(task.taskTime.toString().split("(")[1].split(")")[0],style: TextStyle(color: Colors.white))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                    ),
                  //Divider(thickness: 2.0,indent: 10.0,endIndent: 10.0,height: 0.0,)
                ],
              );
            }
        ),
      ):Center(child: Container(width:15.0,height:15,color: Colors.red,),),
    );
  }
}

