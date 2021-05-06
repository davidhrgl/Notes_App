import 'package:flutter/material.dart';
import 'package:notes_app_me/utils/consts.dart';

class EditBarCustom extends StatelessWidget {
  const EditBarCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 30.0,
            color: blackLighColor.withOpacity(0.2),
            offset: Offset(0,1.0),
            spreadRadius: 1.0
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 10.0,),
            InkWell(
              child: Icon(Icons.arrow_back_ios,color: purpleColor,),
              onTap: () {
                Navigator.pop(context);
              },),
            SizedBox(width: 10.0,),
            Expanded(
              child: Container(
                width: double.infinity,
              ),
            ),
            SizedBox(width: 10.0,),
            Icon(Icons.flip_rounded,color: purpleColor,),
            SizedBox(width: 20.0,),
            Icon(Icons.undo_outlined,color: purpleColor),
            SizedBox(width: 20.0,),
            Icon(Icons.redo_outlined,color: purpleColor),
            SizedBox(width: 40.0,),
            Icon(Icons.check_circle_outline_outlined,color: purpleColor),
            SizedBox(width: 10.0,),
          ],
        ),
      ),
    );
  }
}