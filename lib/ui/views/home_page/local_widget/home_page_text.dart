import 'package:flutter/material.dart';

class HomePageText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding : EdgeInsets.only(top: 60,right: 80),
      child:  Column(
        crossAxisAlignment : CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              style:  TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 35,fontFamily: 'SpoqaHanSansNeo'),
              children: [
                TextSpan(text: "PALETTE", style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue,fontSize: 35,fontFamily: 'Staatliches')),
                TextSpan(text: " 사이트에\n\n"),
                TextSpan(text: "방문해 주셔서\n\n"),
                TextSpan(text: "대단히 감사합니다\n\n"),
                TextSpan(text: "다양한 색상을 비교해 보세요!\n")
              ])),
          GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, '/main'),
            behavior: HitTestBehavior.opaque,
            child: Container(
              width: 300,
              height : 50,
              margin: EdgeInsets.only(top:40),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Color.fromRGBO(247, 135, 100, 1.0)
              ),
              child: Text('사이트 이용해보기',style: TextStyle(fontFamily: 'SpoqaHanSansNeo',color : Colors.white,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
          )
        ],
      ),
    );
  }

}