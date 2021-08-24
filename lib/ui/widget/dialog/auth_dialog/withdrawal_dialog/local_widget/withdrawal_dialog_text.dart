import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class WithdrawalDialogText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text('탈퇴시 주의사항',style: AppThemes.textTheme.headline1!.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(height: 30),
          Text('회원 탈퇴시\n회원님의 모든 정보가 삭제 됩니다.\n한 번 삭제된 정보는 복구 불가능합니다.',style: AppThemes.textTheme.bodyText1,),
          Padding(
            padding: EdgeInsets.only(top: 20,bottom: 10),
            child: Text('이메일 정보 확인',style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
          ),
          Text('aaaa@aaaa.com',style: AppThemes.textTheme.bodyText1,),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text('비밀번호 확인',style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
          ),
        ],
      ),
    );
  }

}