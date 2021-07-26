import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class LoginStatus extends StatefulWidget{
  @override
  _LoginStatusState createState() => _LoginStatusState();
}

class _LoginStatusState extends State<LoginStatus>{
  OverlayEntry? _overlayEntry;
  OverlayState? _overlayState;

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
      onTap: ()  async{
        _overlayEntry = _createOverlayEntry();
        _overlayState!.insert(_overlayEntry!);
        await Future<dynamic>.delayed(Duration(seconds: 2));
        _overlayEntry!.remove();

      },
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.grey[300],
      ),
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
                  child: Text('로그 아웃',style: AppThemes.textTheme.bodyText1,),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
    );
  }
}