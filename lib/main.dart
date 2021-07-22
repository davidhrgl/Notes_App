import 'package:flutter/material.dart';
import 'package:notes_app_me/app/viewmodel/home_viewmodel.dart';
import 'package:notes_app_me/app/view/home/home_view.dart';
import 'package:notes_app_me/app/view/note/note_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> new HomeViewModel(context)),
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