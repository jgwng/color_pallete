import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class PaletteMemoInfo extends StatelessWidget{
  PaletteMemoInfo({required this.memo});
  final String memo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : EdgeInsets.symmetric(horizontal: 24,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('팔레트 메모',style : AppThemes.textTheme.subtitle2!.copyWith(fontWeight : FontWeight.w700)),
          Text(memo,style : AppThemes.textTheme.bodyText1)
        ],
      ),
    );
  }

}