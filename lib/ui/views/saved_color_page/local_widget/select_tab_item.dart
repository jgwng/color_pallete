import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class SelectTabItem extends StatelessWidget{
  SelectTabItem({required this.onPressed,required this.isColor,required this.title});
  final VoidCallback onPressed;
  final String title;
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child : Container(
          width: 80,
          height: 40,
          margin: EdgeInsets.only(left: 20),
          padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: isColor ? Colors.blue : Colors.transparent,width: 2))
          ),
          alignment: Alignment.center,
          child: Text(title,style: AppThemes.textTheme.bodyText1,),
        )
    );
  }

}