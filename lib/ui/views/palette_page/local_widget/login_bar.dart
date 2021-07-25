import 'package:colorpallete/business_models/view_models/auth_view_model.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/views/palette_page/local_widget/login_status.dart';
import 'package:colorpallete/ui/views/palette_page/local_widget/unlogin_status.dart';
import 'package:flutter/material.dart';

class PaletteLoginBar extends StatefulWidget{
  @override
  _PaletteLoginBarState  createState() => _PaletteLoginBarState();
}

class _PaletteLoginBarState extends State<PaletteLoginBar>{

  final paletteAuth = serviceLocator.get<AuthViewModel>();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('PALETTE',style: AppThemes.textTheme.caption,),
              SizedBox(width:40),
              Text('스페이스 바를 눌러 팔레트에 변화를 확인하세요',style: AppThemes.textTheme.bodyText2!.copyWith(color: Colors.grey[400]))
            ],
          ),
          (paletteAuth.baseUser.userUID == null) ? UnLoginStatus() : LoginStatus()
        ],
      ),
    );
  }

}