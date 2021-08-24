
import 'package:colorpallete/business_models/view_models/auth_view_model.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/auth_text_field.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/local_widget/auth_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/local_widget/auth_dialog_title.dart';

import 'package:colorpallete/utils/unFocus.dart';
import 'package:colorpallete/utils/validator.dart';

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

  final model = serviceLocator.get<AuthViewModel>();

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

    return GestureDetector(
      onTap: () => unFocus(context),
      behavior: HitTestBehavior.opaque,
      child: Dialog(
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
                AuthTFT(labelText: '이메일', controller: email!,focusNode: emailNode,function: (String text) => model.setLoginEmail(text),
                  submitFunction: (String? text) => emailNode!.requestFocus(pwNode),validator: emailCheck,),
                AuthTFT(labelText: '비밀번호', controller: pw!,focusNode: pwNode,function: (String text) => model.setLoginPW(text),obscureText: true,
                    validator: pwCheck, submitFunction: (String? text) => model.userLogin(context)),
                AuthDialogBottom(buttonTitle: '로그인',onPressed: () => model.userLogin(context),isLogin: true,)
              ],
            ),
          )),
    );
  }
}