import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/utils/set_color_value.dart';
import 'package:flutter/material.dart';

class SaveColorInfo extends StatelessWidget{
  SaveColorInfo({required this.colorInfo});
  final Color colorInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal : 24),
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('색상값',style:AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
            Container(
                width: 100,
                height: 40,
                decoration : BoxDecoration(
                    color: colorInfo,
                    borderRadius : BorderRadius.circular(6.0)
                ),
                alignment: Alignment.center,
                child : Text('0x${colorInfo.value.toRadixString(16).toUpperCase()}',style:
                AppThemes.textTheme.bodyText1!.copyWith(color:setTextColor(colorInfo)))
            ),
          ],
        )
    );
  }

}