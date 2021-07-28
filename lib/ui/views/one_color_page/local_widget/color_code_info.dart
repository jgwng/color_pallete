
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_preview_info.dart';
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_text_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorCodeInfo extends StatefulWidget{
  @override
  _ColorCodeInfoState createState() => _ColorCodeInfoState();
}

class _ColorCodeInfoState extends State<ColorCodeInfo>{
  double iconSize = 40;
  List<String> gridItems = ['RGB','HEX','HSB','HSL','CMYK','LAB','XYZ','HSP'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorPreviewInfo(),
              ColorTextInfo()
            ],
          ),
          SizedBox(width: 60,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('색상별 코드 보기'),
              SizedBox(height:20),
              Container(
                width: 400,
                height: 500,
                child :  GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: (20 / 8),
                  children: gridItems.map((data) =>
                      GestureDetector(
                          onTap: (){},
                          child: Container(width: 200,height: 40,
                              margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              color: Colors.grey[200]!,
                              child: Center(
                                  child: Text(data,
                                      style: TextStyle(fontSize: 20, color: Colors.black),
                                      textAlign: TextAlign.center)
                              )))

                  ).toList(),
                ),)
            ],
          )
        ],
      )
    );
  }

}