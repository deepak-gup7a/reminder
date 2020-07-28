
import 'package:flutter/material.dart';
import 'package:reminder/bloc/task_bloc.dart';
import 'package:reminder/widgets/icon_picker.dart';
import 'package:reminder/model/task.dart';

class AddNewTask extends StatefulWidget {
  @override
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {

  List<String> months = [
    "january","february","march","april","may","june","july","august","september","october","november","december"
  ];


  TextEditingController _taskNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  IconData icon = Icons.title;
  bool raiseError = false;
  DateTime pickedDate;
  TimeOfDay pickedTime;
  final TaskBloc tb = TaskBloc();

  _addTask(Task task){
    Navigator.of(context).pop(task);
  }

  _addNewTask(){
    Task task = new Task("",Icons.title,"",DateTime.now(),TimeOfDay.now());
    if(_taskNameController.text.isEmpty){
      setState(() {
        raiseError = true;
      });
      print("cc");
    }
    else{
      print("called");
      task.taskName = _taskNameController.text;
      if(_descriptionController.text.isEmpty){
        task.description = "highly important";
      }
      else
        task.description = _descriptionController.text;
      task.leadingIcon = icon;
      task.taskDate = pickedDate;
      task.taskTime = pickedTime;
      _addTask(task);
    }
  }

  _pickDate()async{
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year-5),
        lastDate: DateTime(DateTime.now().year+5)
    );
    if(date!=null)
      {
          setState(() {
              pickedDate = date;
          });
      }
  }

  _pickTime()async{
    TimeOfDay time = await showTimePicker(context: context, initialTime: pickedTime);
    if(time!=null)
      {
          setState(() {
              pickedTime = time;
          });
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
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    pickedTime = TimeOfDay.now();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
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
                  ListTile(
                    dense: false,
                    title: Text("Date: ${pickedDate.day} "+months[pickedDate.month-1].toString() + " ${pickedDate.year}  "),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickDate,
                  ),
                  ListTile(
                    dense: false,
                    title: Text("Time:  ${pickedTime.hour}"+" : "+"${pickedTime.minute}"),
                    trailing: Icon(Icons.keyboard_arrow_down),
                    onTap: _pickTime,
                  ),
                  Container(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Text("Add"),
                      onPressed: _addNewTask,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
