import 'package:colorpallete/auth_text_field.dart';
import 'package:colorpallete/validator.dart';
import 'package:flutter/material.dart';

class LoginNSignUpDialog extends StatefulWidget{
  @override
  _LoginNSignUpDialogState createState() => _LoginNSignUpDialogState();
}

class _LoginNSignUpDialogState extends State<LoginNSignUpDialog>{
  TextEditingController? nickname;
  TextEditingController? email;
  TextEditingController? password;

  FocusNode? nameNode;
  FocusNode? emailNode;
  FocusNode? pwNode;

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
    return Dialog(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0))
    ),
     child: Container(
       width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            child:ListTile(
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.close),
              ),
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text('팔레트 상세 정보 확인',style: TextStyle(fontFamily: 'SpoqaHanSansNeo'),),
                ),
              ),
              trailing: Opacity(
                opacity: 0,
                child: Icon(Icons.close),
              ),

            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Divider(
              color: Colors.grey[200],height: 1,thickness: 1,
            ),
          ),
          AuthTFT(labelText: '닉네임', controller: nickname!,focusNode: nameNode,function: (String text) {},
            submitFunction: (String? text) => nameNode!.requestFocus(emailNode),validator: nameCheck,),

          AuthTFT(labelText: '이메일', controller: email!,focusNode: emailNode,function: (String text) {},
            submitFunction: (String? text) => emailNode!.requestFocus(pwNode),validator: emailCheck,),

          AuthTFT(labelText: '비밀번호', controller: password!,focusNode: pwNode,function: (String text) {},
            submitFunction: (String? text) {},validator: pwCheck,)

        ],
      ),



     ));
  }

}