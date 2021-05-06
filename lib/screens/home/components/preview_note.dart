import 'package:flutter/material.dart';
import 'package:notes_app_me/models/note_model.dart';
import 'package:notes_app_me/utils/color_convert.dart';
import 'package:notes_app_me/utils/consts.dart';
class PreviewNote extends StatelessWidget {

  final NoteModel prevNote;
  PreviewNote({
    Key key,
    this.prevNote
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorConvert(this.prevNote.color).withOpacity(0.4),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.prevNote.title, style: TextStyle(color: colorConvert(this.prevNote.color),fontSize: 20.0,fontWeight: FontWeight.bold)),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Icon(Icons.check_circle,color: Colors.white.withOpacity(0.2),),
                SizedBox(width: 20.0,),
                Text('Tasks', style: TextStyle(color: Colors.white,fontSize: 15.0,decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Icon(Icons.remove_circle_outline,color: Colors.white,),
                SizedBox(width: 20.0,),
                Text('Tasks', style: TextStyle(color: Colors.white,fontSize: 15.0,decoration: TextDecoration.lineThrough)),
              ],
            ),
            SizedBox(height: 5.0,),
            ElevatedButton(
              onPressed: (){}, 
              child: Row(
                children: [
                  Icon(Icons.alarm_on_sharp,color: secondColor,),
                  SizedBox(width: 8.0,),
                  Text('Sund, 8:00', style: TextStyle(color: secondColor,fontSize: 10.0)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: colorConvert(this.prevNote.color).withOpacity(0.3),
                elevation: 0.0,
                side: BorderSide(
                  width: 0.5,
                  color: colorConvert(this.prevNote.color),
                ),
                textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
              ),
            ),
            ElevatedButton(
              onPressed: (){}, 
              child: Row(
                children: [
                  Icon(Icons.multitrack_audio_sharp,color: secondColor,),
                  SizedBox(width: 8.0,),
                  Text('Audio', style: TextStyle(color: secondColor,fontSize: 10.0)),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: colorConvert(this.prevNote.color).withOpacity(0.3),
                elevation: 0.0,
                side: BorderSide(
                  width: 0.5,
                  color: colorConvert(this.prevNote.color),
                ),
                textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)
              ),
            ),
          ],
        ),
      )
    );
  }
}