import 'package:flutter/material.dart';
import 'package:notes_app_me/app/viewmodel/home_viewmodel.dart';
import 'package:notes_app_me/src/utils/consts.dart';
import 'package:provider/provider.dart';
import 'components/search_bar.dart';
import 'components/custom_nav_bar.dart';
import 'components/grid_notes.dart';
import 'components/side_menu.dart';
class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);   
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
                GridNotes(notes: homeVM.notesGroup),
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

        //   final note = new NoteModel(
        //     title: 'Primera Nota desde BD',
        //     color: '#b30075',
        //     content: 'Esta es una nota 1'
        //   );
        //   Provider.of<NotesListProvider>(context,listen: false).newNote(note);
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
