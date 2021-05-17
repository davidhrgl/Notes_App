import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:notes_app_me/models/note_model.dart';
export 'package:notes_app_me/models/note_model.dart';

class DBProvider{
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async{
    if(_database != null) return _database;

    _database = await initDB();

    return _database;
  }


  Future<Database> initDB() async{
    //Path DB
    Directory documentsDirectory =  await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,'NotesApp.db');
    print(path);

    //Create DB
    return await openDatabase(
     path,
     version: 1,
     onCreate: (db, version) async{
       await db.execute('''
        CREATE TABLE note(
          id INTEGER PRIMARY KEY,
          title TEXT,
          image TEXT,
          tasks TEXT,
          content TEXT,
          color TEXT
        );

        CREATE TABLE media(
          id INTEGER PRIMARY KEY,
          id_note INTEGER,
          path TEXT,
          type TEXT
        );

        CREATE TABLE task(
          id INTEGER PRIMARY KEY,
          id_note INTEGER,
          content TEXT,
          state INTEGER
        );
       ''');
     },
    );
  }

  Future<int> newNote(NoteModel note) async{
    //Verify DB
    final db = await database;
    final int res = await db.insert("note", note.toJson());
    return res;
  }
  Future<int> newMedia(MediaModel media) async{
    //Verify DB
    final db = await database;
    final int res = await db.insert("media", media.toJson());
    return res;
  }
  Future<int> newTask(TaskModel task) async{
    //Verify DB
    final db = await database;
    final int res = await db.insert("task", task.toJson());
    return res;
  }

}