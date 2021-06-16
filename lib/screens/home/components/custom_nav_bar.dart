import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_me/utils/consts.dart';

class CustomNavBar extends StatefulWidget {
  final List<IconData> icons;
  CustomNavBar({Key key,this.icons}) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  @override
  Widget build(BuildContext context) {

    var _bottomNavIndex = 0; 


    return AnimatedBottomNavigationBar.builder(
        itemCount: widget.icons.length, 
        tabBuilder: (index, isActive) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icons[index],
                size: 24,
                color: Colors.white,
              ),
              SizedBox(height: 4,),
            ],
          );
        }, 
        backgroundColor: bluedarkColor,
        activeIndex: _bottomNavIndex,
        splashColor: primaryColor, 
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.end,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        onTap: (index) => setState(()=> _bottomNavIndex = index),
      );
  }
}