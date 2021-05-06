import 'package:flutter/material.dart';
import 'package:notes_app_me/utils/consts.dart';
import 'package:notes_app_me/widgets/edit_bar.dart';

class NoteScreen extends StatefulWidget {

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children:[
          SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 70.0,color: Colors.white,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Desing Principles',style: TextStyle(color: navyColor,fontSize: 35.0,fontWeight: FontWeight.bold),),
                            SizedBox(height: 10.0,),
                            Text('Sun, 10:24 | 4096 characters',style: TextStyle(color: greyColor,fontWeight: FontWeight.bold),),
                            SizedBox(height: 30.0,),
                            Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 6.0,
                                      color: purpleColor,
                                    )
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0, left: 25.0),
                                  child: Text('The beauty comer from conecting principles for high conversion rates with worl-class design.',
                                  style: TextStyle(color: Colors.blueGrey[700],fontSize: 20.0)),
                                ),
                              ),
                            SizedBox(height: 30.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                taskComplete('Read the book'),
                                SizedBox(height: 10.0,),
                                taskComplete('Write out the main thoughts'),
                                SizedBox(height: 10.0,),
                                taskPending('Try a fex principiples on practice'),
                              ],
                            ),
                            SizedBox(height: 30.0,),
                            buildContainer(),
                            SizedBox(height: 30.0,),
                            buildContainer(),
                            SizedBox(height: 30.0,),
                            buildContainer(),
                            
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.only(
                            //       bottomLeft: Radius.circular(22.0),
                            //       topLeft: Radius.circular(22.0),
                            //       topRight: Radius.circular(22.0)
                            //     ),
                            //   color: yellowColor
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: Text('Bienvenid@ a esta Nota!',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          Positioned(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: EditBarCustom(),
            )
          ),
          Positioned(
            height: 300,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                decoration: const BoxDecoration(
                  color: navyColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      right: 0,
                      bottom: 15,
                      child: Icon(
                        Icons.more_horiz_outlined,
                        color: secondColor,
                        size: 40,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          circleColor(purpleColor),
                          circleColor(yellowLightColor),
                          circleColor(Colors.white),
                          circleColor(pinkRedColor),
                          circleColor(greenColor),
                          circleColor(orangeStrongColor),
                          circleColor(blackColor),
                        ],
                      )
                    ),
                    getItemMenu(Icons.delete_forever_outlined,'Delete note',60),
                    getItemMenu(Icons.copy_outlined,'Make a copy',110),
                    getItemMenu(Icons.share_outlined,'Share',160),
                    getItemMenu(Icons.label_important_outline,'Labels',210),
                     
                  ],
                ),
              ),
            ),
          ),
        ] 
        )
      ),
    );
  }

  Widget buildContainer() {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: secondColor,
      ),
    );
  }

  Widget taskComplete(String text){
    return Row(
      children: [
        Icon(Icons.check_box,color: pinkRedColor,),
        SizedBox(width: 20.0,),
        Text(text, style: TextStyle(color: blackLighColor,fontSize: 15.0,decoration: TextDecoration.lineThrough)),
      ],
    );
  }
  Widget taskPending(String text){
    return Row(
      children: [
        Icon(Icons.check_box_outline_blank_sharp,color: pinkRedColor,),
        SizedBox(width: 20.0,),
        Text(text, style: TextStyle(color: blackLighColor,fontSize: 15.0)),
      ],
    );
  }

  Widget circleColor(Color color){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.5),
      height: 35.0,
      width: 35.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: greyLightColor,width: 3.0),
      ),
    );
  }

  Widget getItemMenu(IconData icon,String text,double offset){
    return Positioned(
      top: offset,
      child: InkWell(
        child: Container(
          child: Row(
            children: [
              Icon(icon,color:Colors.white,size: 30.0,),
              SizedBox(width: 20.0,),
              Text(text,style: TextStyle(color: Colors.white,fontSize: 20.0),)
            ],
          ),
        ),
        onTap: (){},
      ),
    );
  }
}


