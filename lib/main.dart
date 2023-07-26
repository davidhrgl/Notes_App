import 'package:flutter/material.dart';
import 'package:notes_app_me/app/view/home/home_view.dart';
import 'package:notes_app_me/app/viewmodel/home_viewmodel.dart';
import 'package:notes_app_me/routes.dart';
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
        theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 39, 91, 223), useMaterial3: true),
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        initialRoute: HomeView.routeName,
        routes: routes
      ),
    );
  }
}