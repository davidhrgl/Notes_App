import 'package:flutter/widgets.dart';
import 'package:notes_app_me/app/view/home/home_view.dart';
import 'package:notes_app_me/app/view/note/note_view.dart';

final Map<String, WidgetBuilder> routes = {
  HomeView.routeName: (context) => const HomeView(),
  NoteView.routeName: (context) => const NoteView(),
};
