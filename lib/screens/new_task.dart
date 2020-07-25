import 'package:flutter/material.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("New Task"),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    onPressed: (){},
                  ),
                  TextField(
                    keyboardType:TextInputType.text,
//                    decoration: InputDecoration(
//                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
//                      hintText: "New Task",
//                      labelText: "task",
//                       errorText: "Name field is required",
//                    ),
                  ),
                ],
              ),
              TextField(
                keyboardType:TextInputType.text,
//                decoration: InputDecoration(
//                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
//                  hintText: "Add Description",
//                  labelText: "Description",
//                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
