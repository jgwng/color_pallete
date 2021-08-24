import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/one_color_page/local_widget/black_n_white_text.dart';
import 'package:flutter/material.dart';

class ColorTextInfo extends StatelessWidget {
  ColorTextInfo({required this.colorValue});

  final String colorValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('배경색 추천',
              style: AppThemes.textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w700),),
          ),
          BlackNWhiteText(isBlack: false, colorValue: colorValue),
          BlackNWhiteText(isBlack: true, colorValue: colorValue),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 30),
            child: Text('${Color(int.parse('FF$colorValue', radix: 16)).computeLuminance() <=0.5 ? '밝은색' : '어두운색'} 배경에 글자 색으로 쓰는것을 추천 드립니다!',
              style: AppThemes.textTheme.subtitle2,
              textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}