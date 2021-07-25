
import 'package:colorpallete/ui/widget/auth_text_field.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog_title.dart';
import 'package:colorpallete/validator.dart';
import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget{
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog>{
  TextEditingController? email;
  TextEditingController? pw;

  FocusNode? emailNode;
  FocusNode? pwNode;


  @override
  void initState(){
    super.initState();
    email = TextEditingController();
    pw = TextEditingController();

    emailNode = FocusNode();
    pwNode = FocusNode();

  }
  @override
  Widget build(BuildContext context) {
    //ESC키 눌렀을 때 화면 팝기능 추가
    return  Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
      child:Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           AuthDialogTitle(title : '환영합니다!'),
            AuthTFT(labelText: '이메일', controller: email!,focusNode: emailNode,function: (String text) {},
              submitFunction: (String? text) => emailNode!.requestFocus(pwNode),validator: emailCheck,),
            AuthTFT(labelText: '비밀번호', controller: pw!,focusNode: pwNode,function: (String text) {},
                submitFunction: (String? text) => pwNode!.requestFocus(emailNode)),
            AuthDialogBottom(buttonTitle: '로그인',onPressed: (){},isLogin: true,)
          ],
        ),
      ));
  }
}