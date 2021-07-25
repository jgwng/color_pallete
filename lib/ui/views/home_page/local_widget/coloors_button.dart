import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class CoolorsButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => html.window.open('https://coolors.co/', 'PlaceholderName'),
      child: Container(
        padding: EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Colors.blue))
        ),
        child: Text('Coolors 사이트 방문하기',style : AppThemes.textTheme.subtitle2!.copyWith(color: Colors.blue)),
      ),
    );
  }
  
}