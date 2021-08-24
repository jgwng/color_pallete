import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';


class ErrorPageText extends StatelessWidget{
  final TextStyle textStyle = AppThemes.textTheme.bodyText1!;


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[50],
      padding: EdgeInsets.symmetric(vertical: 40,horizontal: 80),
      child: Column(
        children: [
          SizedBox(height: 5,),
          Text('잘못된 주소로 접근하셨습니다.\n',style: textStyle),
        ],
      ),
    );
  }

}