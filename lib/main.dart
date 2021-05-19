import 'package:flutter/material.dart';
import 'package:notes_app_me/provider/notes_provider.dart';
import 'package:notes_app_me/screens/home/home_screen.dart';
import 'package:notes_app_me/screens/notes/note_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new NotesListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        initialRoute: 'home',
        routes: {
          'home'  : (BuildContext context) => HomeScreen(),
          'note'  : (BuildContext context) => NoteScreen(),
        },
      ),
    );
  }
}