import 'package:flutter/material.dart';
import 'package:notes_app_me/app/model/note_model.dart';
import 'package:notes_app_me/src/services/db_service_provider.dart';

class NoteViewModel extends ChangeNotifier{
  NoteModel _note;

  //Getter
  NoteModel get note => this._note;

  //Methods
  Future<NoteModel> newNote(NoteModel newNt) async{
    _note = newNt;
    final int id = await DBProvider.db.newNote(newNt);
    _note.id = id;
    notifyListeners();
    return _note;
  }

}