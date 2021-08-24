import 'package:flutter/material.dart';

class PaletteItemInfo extends StatelessWidget{
  PaletteItemInfo({required this.index,required this.currentIndex,required this.onPressed});
  final int index,currentIndex;
  final VoidCallback onPressed;
  final List<Color> colorList = [Colors.red,Colors.blue,Colors.green,Colors.indigo,Colors.black];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular((index == 0) ? 5 : 0),
                  bottomLeft: Radius.circular((index == 0) ? 5 : 0),
                  topRight: Radius.circular((index == 4) ? 5 : 0),
                  bottomRight: Radius.circular((index == 4) ? 5 : 0)
              ),
              color: colorList[index],
            ),
            alignment: Alignment.center,
            child: Icon(Icons.circle,size: 10,color:(index == currentIndex)  ? Colors.white : Colors.transparent),
          )
      ),
    );
  }
 }
