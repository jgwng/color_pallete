import 'package:color_models/color_models.dart';
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
          SizedBox(height: 20,),
          Text('색상 밝게 조절'),
          SizedBox(height: 50,),
          SizedBox(
            width: 800,height: 60,
            child:  ListView.builder(
            itemBuilder: (ctx,i) =>  colorItem(i,true),
            itemCount: 10,
            scrollDirection: Axis.horizontal,
          )),
          SizedBox(height: 50,),
          Text('색상 어둡게 조절'),
          SizedBox(height: 50,),
          SizedBox(
              width: 800,height: 60,
              child:  ListView.builder(
                itemBuilder: (ctx,i) =>  colorItem(i,false),
                itemCount: 10,
                scrollDirection: Axis.horizontal,
              )),

        ],
      )
    );
  }

  Widget colorItem(int index,bool isCooler){

    int a = Colors.red.red;
    int b = Colors.red.green;
    int c = Colors.red.blue;


   var newColorValue = CmykColor.from(RgbColor(Colors.red.red,Colors.red.green,Colors.red.blue));
//    var list = newColorValue.toFactoredList();
//   print(list);
//    newColorValue = newColorValue.cooler((index+1)*10);
    newColorValue = isCooler ? newColorValue.cooler(((index+1)*9)) : newColorValue.warmer((index+1)*9,relative: false);
    var newColor = RgbColor.from(newColorValue);

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
            color:Color.fromRGBO(newColor.red, newColor.green, newColor.blue, 1.0),
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