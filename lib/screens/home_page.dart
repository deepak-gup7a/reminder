import 'package:flutter/material.dart';
import 'package:reminder/model/task.dart';
import 'package:reminder/screens/new_task.dart';
import 'package:reminder/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Task task = Task();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
          child: HomeAppBar()
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context)=>AddNewTask())
          );
        },
      ),

      body: ListView.builder(
          itemCount: sampleTask.length,
          itemBuilder: (context,index){
            Task task = sampleTask[index];
            return Padding(
              padding: EdgeInsets.all(10.0),
              child: Container(
                //color: Colors.brown,
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
    );
  }
}
