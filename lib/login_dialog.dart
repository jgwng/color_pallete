import 'package:colorpallete/auth_text_field.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:colorpallete/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginDialog extends StatefulWidget{
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog>{
  TextEditingController? email;
  TextEditingController? pw;

  FocusNode? emailNode;
  FocusNode? pwNode;
  FocusNode? dialogNode;


  @override
  void initState(){
    super.initState();
    email = TextEditingController();
    pw = TextEditingController();

    emailNode = FocusNode();
    pwNode = FocusNode();
    dialogNode = FocusNode();
  }
  @override
  Widget build(BuildContext context) {
    //ESC키 눌렀을 때 화면 팝기능 추가
    return RawKeyboardListener(
        autofocus: true,
        focusNode: dialogNode!,
        onKey: (event){
      if(event.isKeyPressed(LogicalKeyboardKey.escape)){
        Navigator.pop(context);
      }
    },
    child : Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left:10,top: 10),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.close),
              ),
            ),
            SizedBox(height:40),
            Text('환영합니다!',style: TextStyle(fontFamily: 'SpoqaHanSansNeo',fontSize: 18,fontWeight: FontWeight.w500),),
            AuthTFT(labelText: '이메일', controller: email!,focusNode: emailNode,function: (String text) {},
              submitFunction: (String? text) => emailNode!.requestFocus(pwNode),validator: emailCheck,),
            AuthTFT(labelText: '비밀번호', controller: pw!,focusNode: pwNode,function: (String text) {},
              submitFunction: (String? text) => pwNode!.requestFocus(emailNode)),
            StandardButton(buttonTitle: '로그인하기',onPressed: (){},hMargin: 40,vMargin: 20,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
                child: Divider(height: 1,thickness: 1,color: Colors.grey[300],),
            ),
            SizedBox(height:30),
            RichText(
              text: TextSpan(text: '아직 회원가입을 하지 않으셨나요? ',style : TextStyle(fontFamily: "SpoqaHanSansNeo"), children:[
                TextSpan(text: '회원가입하기',style : TextStyle(fontFamily: "SpoqaHanSansNeo"), recognizer: TapGestureRecognizer()
                  ..onTap = () {}),
              ]),
            ),
            SizedBox(height:30)


          ],
        ),
      ),
    ));
  }

}