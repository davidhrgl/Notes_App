import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app_me/app/model/note_model.dart';
import 'package:notes_app_me/app/view/home/components/preview_note.dart';

class GridNotes extends StatelessWidget {
  final List<NoteModel?>? notes;
  const GridNotes({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: notes!.length,
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          tileBottomSpace: 60,
          pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              5 / 7,
              alignment: AlignmentDirectional.center,
            ),
          ],
        ),
        itemBuilder: (context, index) => PreviewNote(
              prevNote: notes![index],
            ));
  }
}
