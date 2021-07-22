import 'package:flutter/material.dart';
import 'package:notes_app_me/src/services/db_service_provider.dart';


class HomeViewModel with ChangeNotifier {
  BuildContext context;
  List<NoteModel> _notesGroup = [];

  //Constructor
  HomeViewModel(BuildContext context){
    this.context = context;
    loadNotes();
  }

  //Getter
  List<NoteModel> get notesGroup => this._notesGroup;

  //Methods
  Future<void> deleteNoteById(int idNote) async{
    await DBProvider.db.deleteNote(idNote);
    this.loadNotes();
  }

  Future<void> loadNotes() async {
    final nots = await DBProvider.db.getAllNotes();
    this._notesGroup = [...nots];
    notifyListeners();
  }
}