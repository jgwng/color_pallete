
import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/service/dialog/show_dialog.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/views/palette_page/local_widget/login_bar.dart';
import 'package:colorpallete/ui/views/palette_page/local_widget/palette_icon_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:universal_html/html.dart' as html;

class PalettePage extends StatefulWidget {
  @override
  _PalettePageState createState() => _PalettePageState();
}

class _PalettePageState extends State<PalettePage>  {
  int currentIndex = -1;
  FocusNode? focusNode;
  List<dynamic> paletteList = [];
  FToast? fToast;
  final provider = serviceLocator.get<PaletteViewModel>();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();

    html.window.addEventListener('mouseout', (event) => mouseOut());
    html.window.addEventListener('beforeunload', (event) => print('closed'));
    provider.initPalette();
    paletteList.add(provider.basePalette);
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  void dispose() {
    super.dispose();
    html.window.addEventListener('mouseout', (event) {
      event.stopImmediatePropagation();
    }, true);
    html.window.addEventListener('beforeunload', (event) {
      event.stopImmediatePropagation();
    }, true);
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        return Future(() => false);
      },
      child: RawKeyboardListener(
        autofocus: true,
        focusNode: focusNode!,
        onKey: (event){
          if(event.isKeyPressed(LogicalKeyboardKey.space)){
            setState(() {
              provider.changePalette();
            });
          }else if(event.isKeyPressed(LogicalKeyboardKey.arrowLeft)){
            setState(() {
              provider.setPreviousPalette();
            });
          }else if(event.isKeyPressed(LogicalKeyboardKey.arrowRight)){
            setState(() {
              provider.setNextPalette();
            });
          }
        },
        child: Scaffold(
          body:  Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              PaletteLoginBar(),
              Container(
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(color: Colors.grey))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding : EdgeInsets.only(top: 10,bottom: 10,right: 10),
                      child: VerticalDivider(width: 1,thickness: 1,color: Colors.grey[400],),
                    ),
                    Tooltip(
                        message: '이전 팔레트',
                        preferBelow: false,
                        textStyle: AppThemes.textTheme.bodyText1!.copyWith(fontSize: 10,color: Colors.white),
                        child : IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_left_square,size:30))),
                    SizedBox(width: 10,),
                    Tooltip(
                        message: '다음 팔레트',
                        preferBelow: false,
                        textStyle: AppThemes.textTheme.bodyText1!.copyWith(fontSize: 10,color: Colors.white),
                        child : IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_right_square,size:30))),
                    Padding(
                      padding : EdgeInsets.only(top: 10,bottom: 10,left: 10),
                      child: VerticalDivider(width: 1,thickness: 1,color: Colors.grey[400],),
                    ),
                    GestureDetector(
                      onTap: (){
                        showPaletteDetailDialog(context);
                        provider.setAddress();
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10,),
                          Tooltip(
                              message: '상세정보 확인',
                              preferBelow: false,
                              textStyle: AppThemes.textTheme.bodyText1!.copyWith(fontSize: 10,color: Colors.white),
                              child : Icon(CupertinoIcons.eye,size:30,color: Colors.black)),
                          SizedBox(width: 10,),
                          Padding(
                            padding: EdgeInsets.only(top:5),
                            child: Text('팔레트 상세 정보',style: TextStyle(fontSize: 12,color: Colors.black,fontFamily: 'SpoqaHanSansNeo')),
                          ),
                          SizedBox(width: 10,),
                          Padding(
                            padding : EdgeInsets.only(top: 10,bottom: 10,left: 10),
                            child: VerticalDivider(width: 1,thickness: 1,color: Colors.grey[400],),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                        onTap: () => showPaletteSaveDialog(context),
                        behavior: HitTestBehavior.opaque,
                        child:  Row(
                          children: [
                            SizedBox(width: 10,),
                            IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark,size:30,color: Colors.black,)),
                            SizedBox(width: 10,),
                            Padding(
                              padding: EdgeInsets.only(top:5,right: 20),
                              child: Text('팔레트 저장',style: TextStyle(fontSize: 12,color: Colors.black,fontFamily: 'SpoqaHanSansNeo')),
                            ),
                            SizedBox(width: 10,),
                          ],
                        )
                    )
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(provider.basePalette.length, (index) {
                    return colorItem(index);
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget colorItem(int index){

    return   Expanded(
      flex: 1,
      child: MouseRegion(
          onEnter: (PointerEvent details) =>_onEnter(index),
          onExit: (PointerEvent details) =>_onExit(index),
          onHover: (PointerEvent details) =>_onHovering(index),
          cursor: SystemMouseCursors.click,
          child : Container(
            alignment: Alignment.center,
            color: provider.basePalette[index],
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Opacity(
                opacity: (index == currentIndex) ? 1 : 0,
                child: Column(
                  children: [
                    PaletteIconItem(listIndex : index,index : 0),
                    SizedBox(height:20),
                    PaletteIconItem(listIndex : index,index :1),
                    SizedBox(height:20),
                    PaletteIconItem(listIndex : index,index :2),
                    SizedBox(height:20),
                    PaletteIconItem(listIndex : index,index :3),
                    SizedBox(height:20),
                    PaletteIconItem(listIndex : index,index :4),
                    SizedBox(height:20),
                    PaletteIconItem(listIndex : index,index :5),
                    SizedBox(height:100),

                  ],
                ),
              ),
              Text('${provider.basePalette[index].value.toRadixString(16).substring(2).toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(
                  color : (provider.basePalette[index].computeLuminance() <=0.5) ? Colors.white : Colors.black,fontFamily: 'SpoqaHanSansNeo',fontSize:30,
                  fontWeight: FontWeight.w700
              ),)
            ],
          ),
        ),
      ),
    );
  }

  void mouseOut(){
    setState(() {
      currentIndex = -1;
    });
  }

  void _onEnter(int index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }

  void _onExit(int index){
    if(mounted){
      setState(() {
        currentIndex = -1;
      });
    }
  }

  void _onHovering(int index){
    if(mounted){
      if(index != currentIndex){
        setState(() {
          currentIndex = index;
        });
      }
    }
  }

  Color? colorConvert(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF"+color));
    } else if (color.length == 8) {
      return Color(int.parse("0x"+color));
    }
  }
}