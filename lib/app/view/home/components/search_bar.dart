import 'package:flutter/material.dart';
import 'package:notes_app_me/src/utils/consts.dart';
class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: blackLighColor,
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            SizedBox(width: 10.0,),
            Icon(Icons.filter_list_outlined,color: Colors.white,),
            SizedBox(width: 20.0,),
            Expanded(
              child: TextField(
                style: TextStyle(color: Colors.white),
                cursorColor: orangeColor,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  filled: false,
                  fillColor: secondColor,
                  hintText: 'Search your Note',
                  hintStyle: TextStyle(
                    color: secondColor,
                  ),
                ),
              )
            ),
            SizedBox(width: 10.0,),
            Icon(Icons.search,color: Colors.white,),
            SizedBox(width: 10.0,),
            // CircleAvatar( 
            //   backgroundImage:AssetImage('assets/img/image1.jpeg')
            // ),

          ],
        ),
      ),
    );
  }
}