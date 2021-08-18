import 'package:colorpallete/business_models/view_models/auth_view_model.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/service/dialog/show_dialog.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:flutter/material.dart';

class LoginStatus extends StatefulWidget{
  @override
  _LoginStatusState createState() => _LoginStatusState();
}

class _LoginStatusState extends State<LoginStatus>{
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;

  final model = serviceLocator.get<AuthViewModel>();

  @override
  void initState(){
    super.initState();
    _overlayState = Overlay.of(context);
  }

  @override
  void dispose() async{
    super.dispose();
    _overlayEntry?.remove();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ()  async{
        _overlayEntry = _createOverlayEntry();
        _overlayState!.insert(_overlayEntry!);
        await Future<dynamic>.delayed(Duration(seconds: 2));
        _overlayEntry!.remove();

      },
      child:Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[300],
              child: Center(
                child: Text('${model.baseUser.nickname!.substring(0,1).toUpperCase()}',style: AppThemes.textTheme.bodyText1,),
              ),
            ),
          ),
          Icon(Icons.arrow_drop_down,size: 30,)
        ],
      ) ,
    );
  }

  OverlayEntry _createOverlayEntry(){
    return OverlayEntry(maintainState: true,builder:(context) =>
        Positioned(
          top:70,right:40,
          child: Container(
            width: 140,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius : BorderRadius.circular(6.0),
                border: Border.all(color:Colors.black,width: 0.5)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
                Material(
                  child: Text('내 팔레트 확인',style: AppThemes.textTheme.bodyText1,),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 60,
                    child: Divider(height: 1,thickness: 1,color: Colors.grey[200],),
                  ),
                ),
                Material(
                  child: Text('로그 아웃',style: AppThemes.textTheme.bodyText1),
                ),
                SizedBox(height: 20,),
                Material(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black, // foreground
                    ),
                    onPressed: () => showWithdrawalDialog(context),
                    child: Text('회원 탈퇴',style: AppThemes.textTheme.bodyText1),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
    );
  }
}