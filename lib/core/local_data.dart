
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

late Database database;

Future<void> createDatabase()async{
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, 'todos.db');


  // open the database
  database = await openDatabase(path, version: 1,
      //create
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE Todo (id INTEGER PRIMARY KEY, title TEXT,dis TEXT, time TEXT, date Text,status TEXT)')
            .then((value) {
          print("table created");
        });
      },
      onOpen: (database) {
        print("open table");

      });
}
Future<void> insertDataBase(
    {
      String ? title,
      String ? dis,
      String ? time,
      String ? date,
    })async {
   await database.transaction((txn) async {
    await txn.rawInsert(
        'INSERT INTO Todo(title,dis, time, date,status) VALUES($title, $dis, $time, $date,"NotDone")');
    print("inserted");

  });
}
Future<void>UpdateDataBase(int id)async {
 await database.rawUpdate(
      'UPDATE Todo SET title = ?, dis = ?, time = ? ,date = ? WHERE id = ?',
      ['title','dis', 'time', 'date','status']);
    print("value is update");

}
Future<void>UpdateStatus(int id)async {
  await database.rawUpdate(
      'UPDATE Todo SET status = ? WHERE id = ?',
      ['status',id]);
    print("status is done");
}
Future<void>deleteDataBase(int id)async {
 await database.rawDelete(
      'DELETE FROM Todo WHERE id = ?', ['id']);
       print("value deleted");
}
Future<List<Map<String,dynamic>>>getDataBase()async{
 return await  database.rawQuery('SELECT * FROM Todo');
}
