import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class PaletteNameInfo extends StatelessWidget{
  PaletteNameInfo({required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.symmetric(horizontal: 24,vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('팔레트명',style : AppThemes.textTheme.subtitle2!.copyWith(fontWeight : FontWeight.w700)),
          Text(name,style : AppThemes.textTheme.bodyText1)
        ],
      ),
    );
  }

}