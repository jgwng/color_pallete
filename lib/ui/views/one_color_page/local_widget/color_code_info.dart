
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_code_text_info.dart';
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_preview_info.dart';
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_text_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorCodeInfo extends StatefulWidget{
  ColorCodeInfo({required this.colorValue});
  final String colorValue;


  @override
  _ColorCodeInfoState createState() => _ColorCodeInfoState();
}

class _ColorCodeInfoState extends State<ColorCodeInfo>{
  double iconSize = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80),
              ColorPreviewInfo(colorValue: widget.colorValue),
              ColorTextInfo(colorValue: widget.colorValue)
            ],
          ),
          SizedBox(width: 60,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80),
              Text('색상별 코드 보기',style : AppThemes.textTheme.subtitle1!.copyWith(fontWeight : FontWeight.w700)),
              Container(
                width: 400,
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.center,
                child:  Text('해당 정보를 클릭하여 색상값을 복사할 수 있습니다!',textAlign: TextAlign.center,
                    style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey[400])),
              ),
              Container(
                width: 400,
                height: 500,
                child :  GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: (15 / 8),
                  children: List.generate(8,(index) => ColorCodeTextInfo(colorCode : widget.colorValue,index : index))
                ),)
            ],
          )
        ],
      )
    );
  }

}