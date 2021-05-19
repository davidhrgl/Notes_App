

import 'package:flutter/material.dart';
import 'package:notes_app_me/models/note_model.dart';
import 'package:notes_app_me/provider/db_provider.dart';

class NotesListProvider extends ChangeNotifier{
  List<NoteModel> notes = [];

  NotesListProvider(){
    this.loadNotes();
  }

  Future<void> loadNotes()async{
    final nots = await DBProvider.db.getAllNotes();
    this.notes = [...nots];
    notifyListeners();
  }

  Future<NoteModel> newNote(NoteModel note) async{
    final int id = await DBProvider.db.newNote(note);
    note.id = id;
    notes.add(note);
    notifyListeners();
    return note;
  }

  Future<void> deleteNote(int idNote) async{
    await DBProvider.db.deleteNote(idNote);
    this.loadNotes();
  }
}