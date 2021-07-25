import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/service/dialog/show_dialog.dart';
import 'package:flutter/material.dart';

class UnLoginStatus extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child : VerticalDivider(width: 1,thickness: 1,color: Colors.grey[200],)
        ),
        SizedBox(width:20),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.grey, // foreground
          ),
          onPressed: () => showSignUpDialog(context),
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('회원가입',style : AppThemes.textTheme.bodyText1!.copyWith(fontSize: 15)),
          ),
        ),
        SizedBox(width:10),
        Container(
            height: 40,
            width: 80,
            child:  TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    )
                ),
                elevation: MaterialStateProperty.all<double>(0.0),
              ),
              onPressed: () => showLoginDialog(context),
              child: Text('로그인',style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.white),),
            )
        )
      ],
    );
  }
}