import 'package:flutter/material.dart';
import 'package:notes_app_me/src/utils/consts.dart';

class EditBarCustom extends StatelessWidget {
  const EditBarCustom({
    Key? key,
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
            offset: const Offset(0,1.0),
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
            const SizedBox(width: 10.0,),
            InkWell(
              child: const Icon(Icons.arrow_back_ios,color: purpleColor,),
              onTap: () {
                Navigator.pop(context);
              },),
            Expanded(
              child: Container(
                width: double.infinity,
              ),
            ),
            const Icon(Icons.delete,color: redColor),
            const SizedBox(width: 20.0,),
            const Icon(Icons.flip_rounded,color: purpleColor,),
            const SizedBox(width: 20.0,),
            const Icon(Icons.undo_outlined,color: purpleColor),
            const SizedBox(width: 20.0,),
            const Icon(Icons.redo_outlined,color: purpleColor),
            const SizedBox(width: 20.0,),
            Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: greenAcentColor,
                ),
                child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Guardar',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}