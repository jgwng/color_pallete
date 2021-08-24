import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class BlackNWhiteText extends StatelessWidget{
  BlackNWhiteText({required this.isBlack,required this.colorValue});
  final bool isBlack;
  final String colorValue;

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
          child: Text('배경색 테스트 하나 둘 셋',style: AppThemes.textTheme.bodyText1!.copyWith(color: Color(int.parse('FF$colorValue', radix: 16)))),
          decoration: BoxDecoration(
              color: isBlack ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(6.0),
              border: Border.all(color: Colors.grey[200]!)
          ),
        )
      ],
    );
  }
//Color(int.parse('FF000000', radix: 16))
}