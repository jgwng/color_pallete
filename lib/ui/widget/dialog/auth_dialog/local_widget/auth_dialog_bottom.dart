import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/service/dialog/show_dialog.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthDialogBottom extends StatelessWidget{
  AuthDialogBottom({required this.buttonTitle,required this.onPressed,required this.isLogin});
  final String buttonTitle;
  final VoidCallback onPressed;
  final bool isLogin;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StandardButton(buttonTitle: buttonTitle,onPressed: onPressed,hMargin: 20,vMargin: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Divider(height: 1,thickness: 1,color: Colors.grey[300],),
        ),
        SizedBox(height:30),
        RichText(
          text: TextSpan(text:(isLogin) ? '아직 회원가입을 하지 않으셨나요? ' : '이미 회원가입을 하셨나요? ',
              style : AppThemes.textTheme.bodyText1, children:[
            TextSpan(text: '${isLogin ? '회원가입' : '로그인'}하기',style : AppThemes.textTheme.bodyText1!.copyWith(color: Colors.blue), recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
                (isLogin) ? showLoginDialog(context) : showSignUpDialog(context);
              }),
          ]),
        ),
        SizedBox(height:30)
      ],
    );
  }

}