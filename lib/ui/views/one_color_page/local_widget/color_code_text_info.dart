import 'package:colorpallete/const/app_text.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/utils/set_color_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorCodeTextInfo extends StatelessWidget{
  ColorCodeTextInfo({required this.index,required this.colorCode});
  final int index;
  final String colorCode;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child:  GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Clipboard.setData(ClipboardData(text:setColorValue(colorCode,index))),
          child: Container(width: 200,height: 40,
              margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              color: Colors.grey[200]!,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(AppText.colorInfoList()[index],style: AppThemes.textTheme.headline2),
                  SizedBox(height: 10),
                  Text(setColorValue(colorCode,index),style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey[400]),),
                ],
              ))),
    );
  }





}