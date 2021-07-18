import 'package:colorpallete/app_themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container(
                   child: Column(
                     crossAxisAlignment : CrossAxisAlignment.start,
                     children: [
                       Text.rich(TextSpan(
                           style:  TextStyle(fontWeight: FontWeight.w700,color: Colors.black,fontSize: 23,fontFamily: 'SpoqaHanSansNeo'),
                           children: [
                             TextSpan(text: "PALETTE", style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue,fontSize: 30,fontFamily: 'Staatliches')),
                             TextSpan(text: " 사이트에\n\n"),
                             TextSpan(text: "방문해 주셔서\n\n"),
                             TextSpan(text: "대단히 감사합니다\n\n"),
                             TextSpan(text: "다양한 색상을 비교해 보세요!\n")
                           ])),
                       GestureDetector(
                         onTap: (){},
                         behavior: HitTestBehavior.opaque,
                         child: Container(
                           width: 200,
                           height: 50,
                           alignment: Alignment.center,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(6.0),
                               color: AppThemes.pointColor
                           ),
                           child: Text('사이트 이용해보기',style: TextStyle(fontFamily: 'SpoqaHanSansNeo',color : Colors.white),),
                         ),
                       )
                     ],
                   )
               ),
               //Image.asset()
             ],
           ),
           SizedBox(height:80),
           Text('본 사이트는 Coolors사이트를 클론한 사이트임을 알려드립니다',style:  TextStyle(fontFamily: 'SpoqaHanSansNeo',color : Colors.grey[400],fontSize: 16,),),
           SizedBox(height: 20,),
           GestureDetector(
             onTap: (){},
             child: Container(
               padding: EdgeInsets.only(bottom: 8),
               decoration: BoxDecoration(
                     border: Border(
                         bottom: BorderSide(color: Colors.blue))
                 ),
               child: Text('Coolors 사이트 방문하기',style : TextStyle(fontWeight: FontWeight.w500,color: Colors.blue,fontSize: 20,fontFamily: 'SpoqaHanSansNeo')),
             ),
           )
         ],
        ),
      ),
    );
  }

}