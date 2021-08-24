import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/error_page/local_widget/error_page_text.dart';
import 'package:flutter/material.dart';

class ErrorPageHeader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50),
      padding: EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.grey
          )
      ),
      child: Column(
        children: [
          Icon(Icons.report,size: 80,color: AppThemes.pointColor,),
          Padding(
            padding: EdgeInsets.only(top: 10,bottom: 30),
            child: Text('잘못된 접근입니다!',style : AppThemes.textTheme.headline1!.copyWith(
                fontWeight: FontWeight.w700
            )),
          ),
          ErrorPageText()
        ],
      ),
    );
  }

}