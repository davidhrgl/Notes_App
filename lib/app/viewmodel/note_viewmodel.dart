import 'package:flutter/material.dart';
import 'package:notes_app_me/src/services/db_service_provider.dart';
import 'dart:math';
import 'dart:developer' as dev;


class NoteViewModel extends ChangeNotifier {
  NoteModel? _note;
  String? title;
  int? id;
  String? content;
  String? color;
  late BuildContext context;
  //Getter
  NoteModel? get note => _note;

  NoteViewModel(this.context);

  //Methods
  void newNote(BuildContext context) async {
    NoteModel newNt =
        NoteModel(color: getColor(), content: content, title: title);
    _note = newNt;
    final int id = await DBProvider.db.newNote(newNt);
    dev.log("Nueva Nota: $id",time: DateTime.now());
    _note!.id = id;
    notifyListeners();
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  String? getColor() {
    Map<int, String> colors = {
      1: '#b30075',
      2: '#00fdad',
      3: '#5000ff',
      4: '#3369FF',
      5: '#ff7000',
      6: '#5efed7',
      7: '#ec9200',
      8: '#fdbe3a',
      9: '#C6D5FF',
      10: '#ee0045',
      11: '#4a4a5d'
    };
    Random random = Random();
    int randomNumber = random.nextInt(10)+1;
    String? color = colors[randomNumber];
    return color;
  }
}
