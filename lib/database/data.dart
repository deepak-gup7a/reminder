import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:reminder/model/icons_list.dart';
import 'package:reminder/model/task.dart';
import 'package:sqflite/sqflite.dart';

class Data{

   Future<Database>database ()async =>openDatabase(
      join(await getDatabasesPath(),'Task_Database.db'),
      version: 1,
      onCreate: (db,version)=>db.execute(
      "CREATE Table TASK(taskName TEXT,leadingIcon INTEGER, description TEXT,taskDate TEXT,taskTime TEXT)"
      )
  );

  Future<void>insertTask (Task task)async{
    final Database db = await database();
    print("insert is call"+db.path);
    await db.insert('TASK',task.toMap(),conflictAlgorithm: ConflictAlgorithm.replace );
  }

  Future<void>deleteTask(Task task)async{
    final Database db = await database();
    print("delete is call");
    await db.delete('TASK',where: "taskName = ? AND description = ?",whereArgs: [task.taskName,task.description]);
  }

  Future<List<Task>>fetchData()async{
    final Database db =await database();
    final List<Map<String,dynamic>>maps = await db.query('Task');
    return await List.generate(
        maps.length,
            (index) => Task(
              maps[index]['taskName'],
              iconList[maps[index]['leadingIcon']],
              maps[index]['description'],
              DateTime.parse(maps[index]['taskDate']),
              TimeOfDay(hour: int.parse(((maps[index]['taskTime'].toString()).split(":"))[0].split("(")[1]),minute: int.parse(((maps[index]['taskTime'].toString()).split(":"))[1].split(")")[0]))
            )
    );
  }

}