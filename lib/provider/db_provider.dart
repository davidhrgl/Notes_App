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


  //===============> Functions to Note-TABLE <===========
  Future<int> newNote(NoteModel note) async{
    //Verify DB
    final db = await database;
    final int res = await db.insert("note", note.toJson());
    return res;
  }

  Future<NoteModel> getNoteById(int id) async{
    final db = await database;
    final res = await db.query('note',where: 'id = ?',whereArgs: [id]);
    return res.isNotEmpty 
            ? NoteModel.fromJson(res.first)
            : null;
  }

  Future<List<NoteModel>> getAllNotes() async{
    final db = await database;
    final res = await db.query('note');
    return res.isNotEmpty 
          ? res.map((e) => NoteModel.fromJson(e)).toList() 
          : [];
  }

  Future<List<NoteModel>> getNotesByTitle(String title) async{
    final db = await database;
    final res = await db.query("note",where: "title like '%?%' ",whereArgs: [title]);
    return res.isNotEmpty 
          ? res.map((e) => NoteModel.fromJson(e)).toList() 
          : [];
  }

  Future<int> updateNote(NoteModel note) async{
    final db = await database;
    final res = await db.update('note', note.toJson(),where: "id = ?",whereArgs: [note.id]);
    return res;
  }

  Future<int> deleteNote(int idNote)async{
    final db = await database;
    // this.deleteMediaByIdNote(note.id);
    // this.deleteTaskByIdNote(note.id);
    final res = await db.delete('note',where: "id = ? ",whereArgs: [idNote]);
    return res;
  }
  //===============> Functions to Media-TABLE <==================

  Future<int> newMedia(MediaModel media) async{
    //Verify DB
    final db = await database;
    final int res = await db.insert("media", media.toJson());
    return res;
  }

  Future<MediaModel> getMediaById(int id) async{
    final db = await database;
    final res = await db.query('media',where: 'id = ?',whereArgs: [id]);
    return res.isNotEmpty 
            ? MediaModel.fromJson(res.first)
            : [];
  }

  Future<List<MediaModel>> getAllMediaByIdNote(int idNote) async{
    final db = await database;
    final res = await db.query("media",where: "id_note = ? ",whereArgs: [idNote]);
    return res.isNotEmpty 
          ? res.map((e) => MediaModel.fromJson(e)).toList() 
          : [];
  }

  Future<int> updateMedia(MediaModel media) async{
    final db = await database;
    final res = await db.update('media', media.toJson(),where: "id = ?",whereArgs: [media.id]);
    return res;
  }

  Future<int> deleteMediaByIdNote(int idNote)async{
    final db = await database;
    final res = await db.delete('media',where: "id_note = ? ",whereArgs: [idNote]);
    return res;
  }
  //===============> Functions to Task-TABLE <=====================

  Future<int> newTask(TaskModel task) async{
    //Verify DB
    final db = await database;
    final int res = await db.insert("task", task.toJson());
    return res;
  }

  Future<TaskModel> getTaskById(int id) async{
    final db = await database;
    final res = await db.query('task',where: 'id = ?',whereArgs: [id]);
    return res.isNotEmpty 
            ? TaskModel.fromJson(res.first)
            : [];
  }

  Future<List<TaskModel>> getAllTaskByIdNote(int idNote) async{
    final db = await database;
    final res = await db.query("task",where: "id_note = ? ",whereArgs: [idNote]);
    return res.isNotEmpty 
          ? res.map((e) => TaskModel.fromJson(e)).toList() 
          : [];
  }

  Future<int> updateTask(TaskModel task) async{
    final db = await database;
    final res = await db.update('task', task.toJson(),where: "id = ?",whereArgs: [task.id]);
    return res;
  }

  Future<int> deleteTaskByIdNote(int idNote)async{
    final db = await database;
    final res = await db.delete('task',where: "id_note = ? ",whereArgs: [idNote]);
    return res;
  }
}