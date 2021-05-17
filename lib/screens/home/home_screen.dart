import 'package:flutter/material.dart';
import 'package:notes_app_me/models/note_model.dart';
import 'package:notes_app_me/screens/home/components/custom_nav_bar.dart';
import 'package:notes_app_me/utils/consts.dart';
import 'package:notes_app_me/screens/home/components/search_bar.dart';

import 'components/grid_notes.dart';
import 'components/side_menu.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<NoteModel> notes = [
    NoteModel(id: 1,color: "#3369ff",content: "Esta es una nota",title: "Primer Nota"),
    NoteModel(id: 2,color: "#b30075",content: "Esta es una nota",title: "Segunda Nota"),
    NoteModel(id: 3,color: "#ff7000",content: "Esta es una nota",title: "Tercer Nota"),
    NoteModel(id: 4,color: "#00c788",content: "Esta es una nota",title: "Cuarta Nota"),
    NoteModel(id: 3,color: "#ffda47",content: "Esta es una nota",title: "Quinta Nota"),
    NoteModel(id: 3,color: "#191927",content: "Esta es una nota",title: "Sexta Nota"),
  ];
  
  @override
  Widget build(BuildContext context) {
    // final size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,),),
        backgroundColor: bluedarkColor,
        actions: [
          Icon(Icons.nights_stay_outlined,color: Colors.white,),
          SizedBox(width: 10,),
        ],
        elevation: 0,
      ),
      drawer: Drawer(
        child: SideMenu(),
      ),
      backgroundColor: bluedarkColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                SearchBarCustom(),
                SizedBox(height: 20.0,),
                GridNotes(notes: notes),
              ],
            ),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        elevation: 10,
        child: Icon(Icons.add,color: Colors.white,),
        onPressed: () { 
          Navigator.pushNamed(context, 'note');
         },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: CustomNavBar(icons: [
              Icons.flip_rounded,
              Icons.mic_none,
              Icons.camera_alt_outlined,
              Icons.brush_outlined,
      ],),
    );
  }
}
