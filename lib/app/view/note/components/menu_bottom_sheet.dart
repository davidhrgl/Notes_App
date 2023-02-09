import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:notes_app_me/src/utils/consts.dart';

const double minHeight = 50;

class MenuBottomSheet extends StatefulWidget {
  const MenuBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  _MenuBottomSheetState createState() => _MenuBottomSheetState();
}

class _MenuBottomSheetState extends State<MenuBottomSheet>  with SingleTickerProviderStateMixin{

  AnimationController? _controller;
  double get maxHeight{
    final height = MediaQuery.of(context).size.height / 2;
    return height;
  }
  double? get headerTopMargin  => lerp(20,20 + MediaQuery.of(context).padding.top);
  double? get headerFontSize   => lerp(0,18);
  double? get colorPalletSize   => lerp(10,60);
  double? get padRight   => lerp(80,0);

  final List<Color> colorPallet = [purpleColor,yellowColor,Colors.white,pinkRedColor,greenAcentColor,orangeColor,blackColor,purpleColor,greyColor,yellowLightColor];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
  //Custome Lerp
  double? lerp(double min, double max) => lerpDouble(min, max, _controller!.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, snapshot) {
        return Positioned(
          height: lerp(minHeight,maxHeight),
          left: 0,
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _toggle,
            onVerticalDragUpdate: _handleDragUpdate,
            onVerticalDragEnd: _handleDragEnd,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              decoration: const BoxDecoration(
                color: navyColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Stack(
                children: [
                  MenuButton(
                    icon: _controller!.status == AnimationStatus.completed ?  Icons.arrow_downward_outlined : Icons.arrow_upward_sharp,
                  ),
                  SheetHeader(fontSize: headerFontSize!, topMargin: headerTopMargin!),
                  Positioned(
                      top: colorPalletSize,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 25,
                        padding: EdgeInsets.only(right: padRight!),
                        child: ListView.builder(
                          itemCount: colorPallet.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CircleColor(color: colorPallet[index]);
                          },
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  void _toggle(){
    final bool isOpen = _controller!.status == AnimationStatus.completed;
    _controller!.fling(velocity: isOpen? -4 : 4);
  }

  Widget getItemMenu(IconData icon,String text,double offset){
    return Positioned(
      top: offset,
      child: InkWell(
        child: Row(
          children: [
            Icon(icon,color:Colors.white,size: 30.0,),
            const SizedBox(width: 20.0,),
            Text(text,style: const TextStyle(color: Colors.white,fontSize: 20.0),)
          ],
        ),
        onTap: (){},
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller!.value -= (details.primaryDelta! / maxHeight);
  }

  void _handleDragEnd(DragEndDetails details) {
    if(_controller!.isAnimating || _controller!.status == AnimationStatus.completed) return;

    final double flingVelocity = details.velocity.pixelsPerSecond.dy / maxHeight;
    if(flingVelocity < 0.0) {
      _controller!.fling(velocity: math.max(4.0, -flingVelocity));
    } else if(flingVelocity > 0.0) {
      _controller!.fling(velocity: math.min(-4.0, -flingVelocity));
    } else {
      _controller!.fling(velocity: _controller!.value < 0.5 ? -4.0 :4.0);
    }
  }
}

class CircleColor extends StatelessWidget {
  final Color color;
  
  const CircleColor({
    Key? key,
    required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3.5),
      height: 35.0,
      width: 35.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: greyLightColor,width: 3.0),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  const MenuButton({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: 15,
      child: Icon(icon,color: secondColor,),
    );
  }
}

class SheetHeader extends StatelessWidget {
  final double fontSize;
  final double topMargin;

  const SheetHeader({Key? key,required this.fontSize,required this.topMargin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topMargin,
      child: Text(
          "Agregar..",
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
      ),
    );
  }
}