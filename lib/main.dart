import 'package:colorpallete/business_models/navigator/back_dispatcher.dart';
import 'package:colorpallete/business_models/navigator/palette_parser.dart';
import 'package:colorpallete/business_models/navigator/palette_router.dart';
import 'package:colorpallete/business_models/view_models/delegate_view_model.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/show_dialog.dart';
import 'package:colorpallete/ui/widget/color_code_copy_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:universal_html/html.dart' as html;
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  setupServiceLocator();
  runApp(
      ProviderScope(
          child:MyApp()
      ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
@override
  _MyAppState createState() => _MyAppState();

}
class _MyAppState extends State<MyApp>{
  PaletteRouterDelegate? delegate;
  final parser = PaletteParser();
  PaletteBackDispatcher? webAppBackDispatcher;
  final provider = serviceLocator.get<DelegateViewModel>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'PALETTE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        backButtonDispatcher: webAppBackDispatcher,
        routeInformationParser: parser,
        routerDelegate: delegate!

    );
  }

}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>  {
  List<Color> colorList = [Colors.red,Colors.blue,Colors.white,Colors.green,Colors.orange];
  int currentIndex = -1;
  static final appContainer = html.window.document.getElementById('app-container');
  FocusNode? focusNode;
  List<dynamic> paletteList = [];
  FToast? fToast;


  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    appContainer!.addEventListener('mouseout', (event) => mouseOut());
    appContainer!.addEventListener('beforeunload', (event) => print('closed'));

    paletteList.add(colorList);
    fToast = FToast();
    fToast!.init(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: focusNode!,
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
          setState(() {
            colorList.shuffle();
            setAddress();
          });
        }
      },
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 60,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('PALETTE',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue,fontSize: 30,fontFamily: 'Staatliches'),),
                      SizedBox(width:40),
                      Text('스페이스 바를 눌러 팔레트에 변화를 확인하세요',style: TextStyle(fontSize: 12,color: Colors.grey[400],fontFamily: 'SpoqaHanSansNeo'))
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child : VerticalDivider(width: 1,thickness: 1,color: Colors.grey[200],)
                      ),
                      SizedBox(width:20),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey, // foreground
                        ),
                        onPressed: () => showSignUpDialog(context),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('회원가입',style : TextStyle(fontSize: 15,fontFamily: 'SpoqaHanSansNeo')),
                        ),
                      ),
                      SizedBox(width:10),
                      Container(
                          height: 40,
                          width: 80,
                          child:  TextButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  )
                              ),
                              elevation: MaterialStateProperty.all<double>(0.0),
                            ),
                            onPressed: () => showLoginDialog(context),
                            child: Text('로그인',style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: 'SpoqaHanSansNeo'),),
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
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
                      textStyle: TextStyle(fontSize: 10,color: Colors.white),
                      child : IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_left_square,size:30))),
                  SizedBox(width: 10,),
                  Tooltip(
                      message: '다음 팔레트',
                      preferBelow: false,
                      textStyle: TextStyle(fontSize: 10,color: Colors.white),
                      child : IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.arrow_right_square,size:30))),
                  Padding(
                    padding : EdgeInsets.only(top: 10,bottom: 10,left: 10),
                    child: VerticalDivider(width: 1,thickness: 1,color: Colors.grey[400],),
                  ),
                  GestureDetector(
                    onTap: ()=> showPaletteDetailDialog(context),
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Tooltip(
                            message: '상세정보 확인',
                            preferBelow: false,
                            textStyle: TextStyle(fontSize: 10,color: Colors.white),
                            child : IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.eye,size:30,color: Colors.black,))),
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
                      onTap: () => showColorSaveDialog(context),
                      behavior: HitTestBehavior.opaque,
                      child:  Row(
                        children: [
                          SizedBox(width: 10,),
                          IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bookmark,size:30,color: Colors.black,)),
                          SizedBox(width: 10,),
                          Padding(
                            padding: EdgeInsets.only(top:5),
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

                children: <Widget>[
                  colorItem(0),
                  colorItem(1),
                  colorItem(2),
                  colorItem(3),
                  colorItem(4),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget colorItem(int index){
    return   Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        color: colorList[index],
        child:MouseRegion(
          onEnter: (PointerEvent details) =>_onEnter(index),
          onExit: (PointerEvent details) =>_onExit(index),
          onHover: (PointerEvent details) =>_onHovering(index),
          cursor: SystemMouseCursors.click,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Opacity(
                opacity: (index == currentIndex) ? 1 : 0,
                child: Column(
                  children: [
                    listIconItem(0),
                    SizedBox(height:20),
                    listIconItem(1),
                    SizedBox(height:20),
                    listIconItem(2),
                    SizedBox(height:20),
                    listIconItem(3),
                    SizedBox(height:20),
                    listIconItem(4),
                    SizedBox(height:20),
                    listIconItem(5),
                    SizedBox(height:100),

                  ],
                ),
              ),
              Text('${colorList[index].value.toRadixString(16).substring(2).toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(
                  color : (colorList[index].computeLuminance() <=0.5) ? Colors.white : Colors.black,fontFamily: 'SpoqaHanSansNeo',fontSize:30,
                  fontWeight: FontWeight.w700
              ),)
            ],
          ),
        ),
      ),
    );
  }


  Widget listIconItem(int index){
    return Tooltip(
      message: toolTipText(index),
      textStyle: TextStyle(fontSize: 10,color: Colors.white),
      child: MouseRegion(
        onEnter: (details) => print('icon enter'),
        onExit: (details) => print('icon exit'),
        child: IconButton(
          onPressed: () {


            fToast!.showToast(
              child: CodeCopyToast(),
              gravity: ToastGravity.BOTTOM,
              toastDuration: Duration(seconds: 2),
            );

            // Custom Toast Position
          },
          icon: listIcon(index),
        ),
      ),
      preferBelow: false,
    );
  }

  Widget listIcon(int index){
    IconData? icon;
    switch(index){
      case 0:
        icon = Icons.clear;
        break;
      case 1:
        icon = Icons.grid_on_rounded;
        break;
      case 2:
        icon = Icons.star_border_outlined;
        break;
      case 3:
        icon = Icons.sync_alt_rounded;
        break;
      case 4:
        icon = Icons.content_copy_rounded;
        break;
      case 5:
        icon = Icons.lock_open_sharp;
        break;
    }
    return Icon(icon,size: 30,color: Colors.black,);
  }

  String toolTipText(int index){
    switch(index){
      case 0:
        return '';
      case 1:
        return '';
      case 2:
        return '';
      case 3:
        return '';
      case 4:
        return '';
      case 5:
        return '';
    }
    return '';
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
    setState(() {
      currentIndex = -1;
    });
  }

  void _onHovering(int index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }

  void setAddress(){
    String address = '';
    for(int i = 0;i<colorList.length;i++){
      String colorValue = colorList[i].value.toRadixString(16).substring(2).toUpperCase();
      address += colorValue + ((i != colorList.length-1) ? '-' : '');
    }
    html.window.history.pushState(null, 'home', address);
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
