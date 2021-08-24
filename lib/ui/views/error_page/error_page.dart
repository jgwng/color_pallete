import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/error_page/local_widget/error_page_header.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPage extends StatelessWidget{

  final TextStyle textStyle = AppThemes.textTheme.bodyText1!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ErrorPageHeader(),
          Container(
            width: 300,
            height: 60,
            margin: EdgeInsets.only(top: 60),
            child: StandardButton(
              buttonTitle: '메인으로!',
              onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
            ),
          )
        ],
      ),
    );
  }


}