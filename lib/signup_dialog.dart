import 'package:colorpallete/auth_text_field.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:colorpallete/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  FocusNode? dialogNode;

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
    dialogNode = FocusNode();

  }





  @override
  Widget build(BuildContext context) {
    return  RawKeyboardListener(
        autofocus: true,
        focusNode: dialogNode!,
        onKey: (event){
      if(event.isKeyPressed(LogicalKeyboardKey.escape)){
        Navigator.pop(context);
      }
    },child : Dialog(
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
                  child: Text('회원가입',style: TextStyle(fontFamily: 'SpoqaHanSansNeo'),),
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
          SizedBox(height:10),
          AuthTFT(labelText: '닉네임', controller: nickname!,focusNode: nameNode,function: (String text) {},
            submitFunction: (String? text) => nameNode!.requestFocus(emailNode),validator: nameCheck,),

          AuthTFT(labelText: '이메일', controller: email!,focusNode: emailNode,function: (String text) {},
            submitFunction: (String? text) => emailNode!.requestFocus(pwNode),validator: emailCheck,),

          AuthTFT(labelText: '비밀번호', controller: password!,focusNode: pwNode,function: (String text) {},
            submitFunction: (String? text) {},validator: pwCheck,),

          SizedBox(height:30),
          RichText(
            text: TextSpan(text: '이미 회원가입을 하셨나요? ',style : TextStyle(fontFamily: "SpoqaHanSansNeo"), children:[
              TextSpan(text: '로그인하기',style : TextStyle(fontFamily: "SpoqaHanSansNeo"), recognizer: TapGestureRecognizer()
                ..onTap = () {
                }),
            ]),
          ),
          SizedBox(height:30),
          StandardButton(buttonTitle: '회원가입',onPressed: (){},hMargin:40,vMargin: 0,),
          SizedBox(height:20)
        ],
      ),
     ))
    );
  }

}