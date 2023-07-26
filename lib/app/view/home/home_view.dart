import 'package:flutter/material.dart';
import 'package:notes_app_me/app/view/note/note_view.dart';
import 'package:notes_app_me/app/viewmodel/home_viewmodel.dart';
import 'package:notes_app_me/src/utils/consts.dart';
import 'package:provider/provider.dart';
import 'components/search_bar.dart';
import 'components/custom_nav_bar.dart';
import 'components/grid_notes.dart';
import 'components/side_menu.dart';

class HomeView extends StatefulWidget {
  static String routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(context),
      child: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: bluedarkColor,
        actions: const [
          Icon(
            Icons.nights_stay_outlined,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        elevation: 0,
      ),
      drawer: const Drawer(
        child: SideMenu(),
      ),
      backgroundColor: bluedarkColor,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SearchBarCustom(),
            const SizedBox(
              height: 20.0,
            ),
          ])),
          GridNotes(notes: (homeVM.notesGroup)),
        ],
      )),
      floatingActionButton: FloatingActionButton(

        backgroundColor: greenAcentColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 10,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, NoteView.routeName);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: const CustomNavBar(
        icons: [
          Icons.flip_rounded,
          Icons.mic_none,
          Icons.camera_alt_outlined,
          Icons.brush_outlined,
        ],
      ),
    );
  }
}
