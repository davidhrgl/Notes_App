import 'package:flutter/material.dart';
import 'package:notes_app_me/app/viewmodel/home_viewmodel.dart';
import 'package:notes_app_me/app/view/home/home_view.dart';
import 'package:notes_app_me/app/view/note/note_view.dart';
import 'package:notes_app_me/src/services/notes_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> HomeViewModel(context)),
        ChangeNotifierProvider(create: (_)=> NotesListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        initialRoute: 'home',
        routes: {
          'home'  : (BuildContext context) => const HomeScreen(),
          'note'  : (BuildContext context) => const NoteScreen(),
        },
      ),
    );
  }
}