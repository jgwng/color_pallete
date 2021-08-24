import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/auth_text_field.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/local_widget/auth_dialog_title.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/withdrawal_dialog/local_widget/withdrawal_dialog_text.dart';

import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:colorpallete/utils/unFocus.dart';
import 'package:colorpallete/utils/validator.dart';
import 'package:flutter/material.dart';

class WithdrawalDialog extends StatefulWidget{
  @override
  _WithdrawalDialogState createState() => _WithdrawalDialogState();
}

class _WithdrawalDialogState extends State<WithdrawalDialog>{
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
              children: [
                AuthDialogTitle(title : '회원 탈퇴'),
                dialogContent()
              ],
            ),
          )),
    );
  }


  Widget dialogContent(){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WithdrawalDialogText(),
          AuthTFT(labelText: '', controller: TextEditingController(),focusNode: FocusNode(),function: (String text) {},obscureText: true,
            submitFunction: (String? text) => {},validator: pwCheck,),
          StandardButton(buttonTitle: '회원 탈퇴',onPressed: (){},hMargin: 20,vMargin: 20),
          Padding(
            padding: EdgeInsets.only(bottom: 20,left: 20,right: 20),
            child: Divider(height: 1,thickness: 1,color: Colors.grey[400],),
          ),
          Container(
            alignment: Alignment.center,
            child: Text('외부로부터 회원님의 정보를 안전하게 보호하기 위해\n비밀번호를 다시 한 번 확인합니다.\n',
              style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey[400],height: 1.5),textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}