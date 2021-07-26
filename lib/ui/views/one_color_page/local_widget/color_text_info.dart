import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class ColorTextInfo extends StatefulWidget{
  @override
  _ColorTextInfoState createState() => _ColorTextInfoState();
}

class _ColorTextInfoState extends State<ColorTextInfo>{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text('배경색 추천',style: AppThemes.textTheme.subtitle1!.copyWith(fontWeight : FontWeight.w700),),
          ),
          BlackNWhiteText(isBlack : false),
          BlackNWhiteText(isBlack : true),
          SizedBox(height:30),
          Container(
            alignment: Alignment.center,
            child: Text('글자 색으로는 밝은색 배경에 쓰시는것을 추천 드립니다!',style: AppThemes.textTheme.subtitle2,textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}

class BlackNWhiteText extends StatelessWidget{
  BlackNWhiteText({required this.isBlack});
  final bool isBlack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Text('${isBlack ? '검은색' : '흰색'} 배경',style: AppThemes.textTheme.bodyText1),
        ),
        Container(
          width: 400,
          height:60,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text('배경색 테스트 하나 둘 셋',style: AppThemes.textTheme.bodyText2!.copyWith(color: Colors.black),),
          decoration: BoxDecoration(
              color: isBlack ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.grey[200]!)
          ),
        )
      ],
    );
  }

}