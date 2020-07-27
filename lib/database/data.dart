import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:reminder/model/icons_list.dart';
import 'package:reminder/model/task.dart';
import 'package:sqflite/sqflite.dart';

class Data{

   Future<Database>database ()async =>openDatabase(
      join(await getDatabasesPath(),'task_database.db'),
      version: 3,
      onCreate: (db,version)=>db.execute(
      "CREATE Table task(taskName TEXT,leadingIcon INTEGER,isNotifiable TEXT, description TEXT)"
      )
  );

  Future<void>insertTask (Task task)async{
    final Database db = await database();
    print("insert is call");
    await db.insert('Task',task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace );
  }

  Future<void>deleteTask(Task task)async{
    final Database db = await database();
    print("delete is call");
    await db.delete('Task',where: "taskName = ?",whereArgs: [task.taskName]);
  }

  Future<List<Task>>fetchData()async{
    final Database db =await database();
    final List<Map<String,dynamic>>maps = await db.query('Task');
    print("fetch data intial");
    print(maps.length);
    return await List.generate(
        maps.length,
            (index) => Task(
              maps[index]['taskName'],
                maps[index]['leadingIcon']!=-1?iconList[maps[index]['leadingIcon']]:Icons.add,
              maps[index]['isNotifiable']=="true"?true:false,
              maps[index]['description']
            )
    );
  }

}