import 'package:color_models/color_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorVariationInfo extends StatefulWidget{
  @override
  _ColorVariationInfoState createState() => _ColorVariationInfoState();

}

class _ColorVariationInfoState extends State<ColorVariationInfo>{
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          colorList('색상 밝게 조절', 0),
          SizedBox(height: 30,),
          colorList('색상 어둡게 조절', 1),
        ],
      )
    );
  }

  Widget colorList(String text, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Text('색상 어둡게 조절'),
        SizedBox(height: 50,),
        SizedBox(
            width: 800,height: 60,
            child:  ListView.builder(
              itemBuilder: (ctx,i) =>  colorItem(i,(index == 0) ? true : false),
              itemCount: 15,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    );
  }








  Widget colorItem(int index,bool isCooler){

//    int a = Colors.red.red;
////    int b = Colors.red.green;
////    int c = Colors.red.blue;
    final orange = RgbColor(255, 144, 0);

    print(orange.opposite); // RgbColor(0, 111, 255);

    print(orange.rotateHue(30)); // RgbColor(239, 255, 0);

    print(orange.rotateHue(-30));
//
//
//   var newColorValue = CmykColor.from(RgbColor(Colors.red.red,Colors.red.green,Colors.red.blue));
//    final color1 = RgbColor(255, 0, 0); // red
//    final color2 = RgbColor(0, 0, 0); // blue
//    final color3 =RgbColor(255, 255, 255);
//    final color4 = RgbColor(Colors.grey[700]!.red, Colors.grey[700]!.green, Colors.grey[700]!.blue);
//    /// Calculate a [List<RgbColor>] of 5 colors: [color1], [color2] and the 3 steps inbetween.
//    final colors = color1.lerpTo(isCooler ? color3 : color2, 8);

// [RgbColor(255, 0, 0, 255), RgbColor(191, 0, 64, 255), RgbColor(128, 0, 128, 255), RgbColor(64, 0, 191, 255), RgbColor(0, 0, 255, 255)]

    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        // Changing the width and height
        width: isExpanded ? 100 : 80,
        // Decoration Portion of the Container
        decoration: BoxDecoration(
            color:Color.fromRGBO(orange.rotateHue(5*index).red, orange.rotateHue(5*index).green, orange.rotateHue(5*index).blue, 1.0),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular((index == 0) ? 8 : 0),
            bottomLeft: Radius.circular((index == 0) ? 8 : 0),
            topRight: Radius.circular((index == 9) ? 8 : 0),
            bottomRight: Radius.circular((index == 9) ? 8 : 0)
        ),),
      ),
    );
  }

}