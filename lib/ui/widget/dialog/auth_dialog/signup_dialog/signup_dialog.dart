import 'package:colorpallete/business_models/view_models/auth_view_model.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/auth_text_field.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/local_widget/auth_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/local_widget/auth_dialog_title.dart';
import 'package:colorpallete/utils/unFocus.dart';
import 'package:colorpallete/utils/validator.dart';

import 'package:flutter/material.dart';

class SignUpDialog extends StatefulWidget{
  @override
  _SignUpDialogState createState() => _SignUpDialogState();
}

class _SignUpDialogState extends State<SignUpDialog>{
  TextEditingController? nickname;
  TextEditingController? email;
  TextEditingController? password;

  FocusNode? nameNode;
  FocusNode? emailNode;
  FocusNode? pwNode;

  final paletteAuth = serviceLocator.get<AuthViewModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nickname = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();

    nameNode = FocusNode();
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
          child: Container(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AuthDialogTitle(title: '회원가입'),

                AuthTFT(labelText: '닉네임', controller: nickname!,focusNode: nameNode,function: (String text) => paletteAuth.setUserNickName(text),
                  submitFunction: (String? text) => nameNode!.requestFocus(emailNode),validator: nameCheck,),

                AuthTFT(labelText: '이메일', controller: email!,focusNode: emailNode,function: (String text) => paletteAuth.setUserEmail(text),
                  submitFunction: (String? text) => emailNode!.requestFocus(pwNode),validator: emailCheck,),

                AuthTFT(labelText: '비밀번호', controller: password!,focusNode: pwNode,function: (String text) {},obscureText: true,
                  submitFunction: (String? text) => paletteAuth.signUpUser(password!.text,context),validator: pwCheck,),

                AuthDialogBottom(buttonTitle: '회원가입',onPressed: () => paletteAuth.signUpUser(password!.text,context),isLogin: false,),
              ],
            ),
          )),
    );
  }

}