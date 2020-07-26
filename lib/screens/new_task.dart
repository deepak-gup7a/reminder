
import 'package:flutter/material.dart';
import 'package:reminder/widgets/icon_picker.dart';
import 'package:reminder/model/task.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {

  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool isNotifiable = true;
  IconData icon = Icons.title;
  bool raiseError = true;

  _addTask(Task task){
    Navigator.of(context).pop(task);
  }


  _addNewTask(){
    Task task = new Task("",Icons.title,true,"");
    if(_taskNameController.text.isEmpty){
      setState(() {
        raiseError = false;
      });
    }
    else{
      task.taskName = _taskNameController.text;
      if(_descriptionController.text.isEmpty){
        task.description = "highly important";
      }
      else
        task.description = _descriptionController.text;
      task.isNotifiable = isNotifiable;
      task.leadingIcon = icon;
      _addTask(task);
    }
  }

  Future<void>_showIconPickerDialog(BuildContext context)async{
    IconData pickedIcon = await showDialog(
      context: context,
      builder: (context)=>AlertDialog(
        title: Text("Pick an Icon"),
        content: IconPicker(),
      )
    );
    if(pickedIcon !=null)
      {
          setState(() {
            icon = pickedIcon;
          });
      }
  }


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
                      icon: Icon(icon),
                      onPressed: (){
                        // ignore: unnecessary_statements
                        _showIconPickerDialog(context);
                      },
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
                        onChanged: (value){
                          setState(() {
                            if(value.isEmpty)
                              raiseError = true;
                            else
                              raiseError = false;
                          });
                        },
                        controller: _taskNameController,
                        keyboardType:TextInputType.text,
                          decoration: InputDecoration(
                            errorText: raiseError?"required":null,
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
                    controller: _descriptionController,
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
                          value: isNotifiable,
                          onChanged: (value){
                            setState(() {
                              isNotifiable = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text("Add"),
                    onPressed: _addNewTask,
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
