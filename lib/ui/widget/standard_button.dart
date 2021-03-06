import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class StandardButton extends StatelessWidget{
  StandardButton({required this.onPressed,required this.buttonTitle,this.vMargin,this.hMargin});
  final String buttonTitle;
  final VoidCallback onPressed;
  final double? vMargin;
  final double? hMargin;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: EdgeInsets.symmetric(horizontal: hMargin ?? 0,vertical: vMargin ?? 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            color: AppThemes.pointColor
        ),
        child: Text(buttonTitle,style: TextStyle(fontFamily: 'SpoqaHanSansNeo',color : Colors.white),),
      ),
    );
  }

}