import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes_app_me/app/model/note_model.dart';



class GridNotes extends StatelessWidget {
  final List<NoteModel?>? notes;
  const GridNotes({
    Key? key,
    required this.notes
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        pattern: [
            const WovenGridTile(1),
            const WovenGridTile(
              5 / 7,
              crossAxisRatio: 0.9,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
      childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => Tile(index: index),
      ),
    );
    // return StaggeredGridView.countBuilder(
    //   shrinkWrap: true,
    //   physics: NeverScrollableScrollPhysics(),
    //   crossAxisCount: 4, 
    //   itemCount: notes.length,
    //   itemBuilder: (context, index) {
    //     return PreviewNote(prevNote: notes[index],);
    //   }, 
    //   staggeredTileBuilder: (index) {
    //     return new StaggeredTile.count(2, index.isEven ? 4 : 3);
    //   },
    //   mainAxisSpacing: 20.0,
    //   crossAxisSpacing: 20.0,
    //   );
  }
}


class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.extent,
    this.bottomSpace,
  }) : super(key: key);

  final int index;
  final double? extent;
  final double? bottomSpace;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      color: const Color(0xFF34568B),
      height: extent,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
          color: Colors.green,
        )
      ],
    );
  }
}