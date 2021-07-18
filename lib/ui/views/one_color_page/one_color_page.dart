import 'package:color_models/color_models.dart';
import 'package:flutter/material.dart';

class OneColorPage extends StatefulWidget{
  @override
  _OneColorPageState createState() => _OneColorPageState();
}

class _OneColorPageState extends State<OneColorPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemBuilder: (ctx,i) => colorTest(i),
          itemCount: 10,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  //   var newColorValue = CmykColor.from(color);
  //        return 'CMYK(${newColorValue.cyan.floor()},${newColorValue.magenta.floor()},${newColorValue.yellow.floor()},${newColorValue.black.floor()})';





  Widget colorTest(int index){
    int a = Colors.red.red;
    int b = Colors.red.green;
    int c = Colors.red.blue;


   var newColorValue = CmykColor.from(RgbColor(Colors.red.red,Colors.red.green,Colors.red.blue));
//    var list = newColorValue.toFactoredList();
//   print(list);
//    newColorValue = newColorValue.cooler((index+1)*10);
    newColorValue = newColorValue.warmer((index+1)*10);
    var newColor = RgbColor.from(newColorValue);


    return Container(
      width: 100,
      height: 40,
      color: Color.fromRGBO(newColor.red, newColor.green, newColor.blue, 1.0),
    );
  }
}