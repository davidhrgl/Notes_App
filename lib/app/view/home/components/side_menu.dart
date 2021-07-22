import 'package:flutter/material.dart';
import 'package:notes_app_me/src/utils/consts.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bluedarkColor,
      height: double.infinity,
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: greenAcentColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[ Text(
                      'Hola \nDavid Hernandez',
                      style: TextStyle(
                        color:greenAcentColor,
                        fontSize: 20,
                      ),
                    ),
                    CircleAvatar( 
                      backgroundImage:AssetImage('assets/img/image1.jpeg')
                    ),
                    ]
                  ),
                ),
                Expanded(
                  child: Container(
                    // height: 100.0,//size.height * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ItemMenu(color: greenAcentColor,textColor: secondColor,text: "Home",icon: Icons.home_rounded,),
                        ItemMenu(color: greenAcentColor,textColor: secondColor,text: "Profile",icon: Icons.person_rounded,),
                        ItemMenu(color: greenAcentColor,textColor: secondColor,text: "Favorites",icon: Icons.favorite_rounded,),
                        ItemMenu(color: greenAcentColor,textColor: secondColor,text: "Help",icon: Icons.help,),
                        ItemMenu(color: greenAcentColor,textColor: secondColor,text: "Settings",icon: Icons.settings,),
                      ],
                    ),
                  ),
                ),
                Divider(color: greenAcentColor,),
                SizedBox(height: 20.0,),
                ItemMenu(color: greenAcentColor,textColor: secondColor,text: "LogOut",icon: Icons.logout,),
                Spacer(),
              ],
            ),
          ),
        ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  final IconData icon;

  ItemMenu({
    Key key,
    this.color,
    this.textColor,
    this.text,
    this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: color,),
        SizedBox(width: 10,),
        Text(text,style: TextStyle(color:textColor,fontWeight: FontWeight.w500),),
      ],
    );
  }
}