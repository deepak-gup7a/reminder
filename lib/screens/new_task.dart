
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New Task"),
                    IconButton(
                      tooltip: "Icon",
                      icon: Icon(Icons.add_circle),
                      onPressed: (){},
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        keyboardType:TextInputType.text,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                            hintText: "New Task",
                            labelText: "task",
                          ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType:TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
                        hintText: "Add Description",
                        labelText: "Description",
                      ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: Text("Reminder "),
                      ),
                      Container(
                        child: Switch(
                          value: true,
                          onChanged: (value){

                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text("Add"),
                    onPressed: (){},
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
