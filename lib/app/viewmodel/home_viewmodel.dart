import 'package:flutter/material.dart';
import 'package:notes_app_me/src/services/db_service_provider.dart';


class HomeViewModel with ChangeNotifier {
  BuildContext? context;
  List<NoteModel?> _notesGroup = [];

  //Constructor
  HomeViewModel(BuildContext this.context){
    loadNotes();
  }

  //Getter
  List<NoteModel?>? get notesGroup => _notesGroup;

  //Methods
  Future<void> deleteNoteById(int idNote) async{
    await DBProvider.db.deleteNote(idNote);
    loadNotes();
  }

  Future<void> loadNotes() async {
    final nots = await DBProvider.db.getAllNotes();
    _notesGroup = [...nots];
    notifyListeners();
  }

    Future<NoteModel> newNote(NoteModel note) async{
      final int id = await DBProvider.db.newNote(note);
      note.id = id;
      _notesGroup.add(note);
      notifyListeners();
    return note;
  }
}