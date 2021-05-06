import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app_me/models/note_model.dart';
import 'package:notes_app_me/screens/home/components/preview_note.dart';



class GridNotes extends StatelessWidget {
  final List<NoteModel> notes;
  GridNotes({
    Key key,
    this.notes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4, 
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return PreviewNote(prevNote: notes[index],);
      }, 
      staggeredTileBuilder: (index) {
        return new StaggeredTile.count(2, index.isEven ? 4 : 3);
      },
      mainAxisSpacing: 20.0,
      crossAxisSpacing: 20.0,
      );
  }
}

