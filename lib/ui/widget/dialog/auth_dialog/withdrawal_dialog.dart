import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/dialog/auth_dialog/auth_dialog_title.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:colorpallete/utils/unFocus.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AuthDialogTitle(title : '회원 탈퇴'),
                SizedBox(height: 20),
                Text('회원 탈퇴시\n회원님의 모든 정보가 삭제 됩니다.\n한 번 삭제된 정보는 복구 불가능합니다.',style: AppThemes.textTheme.bodyText1,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('이메일 정보 확인',style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
                ),
                Text('aaaa@aaaa.com',style: AppThemes.textTheme.bodyText1,),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('비밀번호 확인',style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
                ),
                TextField(),
                StandardButton(buttonTitle: '회원 탈퇴',onPressed: (){},hMargin: 0,vMargin: 20,),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Divider(height: 1,thickness: 1,color: Colors.black,),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text('외부로부터 회원님의 정보를 안전하게 보호하기 위해\n비밀번호를 다시 한 번 확인합니다.\n',
                    style: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey[400],height: 1.5),textAlign: TextAlign.center,),
                )

              ],
            ),
          )),
    );
  }
  
}