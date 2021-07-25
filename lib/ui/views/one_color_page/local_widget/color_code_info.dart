
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorCodeInfo extends StatefulWidget{
  @override
  _ColorCodeInfoState createState() => _ColorCodeInfoState();
}

class _ColorCodeInfoState extends State<ColorCodeInfo>{
  double iconSize = 40;
  List<String> gridItems = ['RGB','HEX','HSB','HSL','CMYK','LAB','XYZ','HSP'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('색상값'),
              Container(
               width: 400,
               height: 60,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(4.0),
                 border: Border.all(color: Colors.grey[200]!)
               ),
               child:  ListTile(
                 title: Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(width:15),
                     Text('#'),
                     SizedBox(width:20),
                     Text('FFFFFF',textAlign: TextAlign.left,)
                   ],
                 ),
                 contentPadding: EdgeInsets.symmetric(vertical: 5),
                 trailing: Container(
                   width: 30,
                   height: 30,
                   margin: EdgeInsets.only(right: 20),
                   color: Colors.black,
                 ),
               ),
             ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child:Text('미리 보기',textAlign: TextAlign.left,),
              ),
              Container(
                width: 400,
                height:40,
                color: Colors.black,
              ),
             Container(
               width: 400,
               decoration: BoxDecoration(
                 border: Border.all(color: Colors.grey[200]!),
                 borderRadius: BorderRadius.circular(4.0)
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.symmetric(vertical: 20),
                     child: Text('배경색 추천'),
                   ),
                   SizedBox(height: 20,),
                   Text('흰색 배경'),
                   SizedBox(height: 20,),
                   Container(
                     width: 400,
                     height:60,
                     alignment: Alignment.center,
                     margin: EdgeInsets.symmetric(horizontal: 20),
                     child: Text('배경색 테스트 하나 둘 셋',style: TextStyle(color : Colors.black),),
                     decoration: BoxDecoration(
                       color: Colors.white,
                       borderRadius: BorderRadius.circular(6.0),
                       border: Border.all(color: Colors.grey[200]!)
                     ),
                   ),
                   SizedBox(height: 20,),
                   Text('검정색 배경'),
                   SizedBox(height: 20,),
                   Container(
                     width: 400,
                     height:60,
                     margin: EdgeInsets.symmetric(horizontal: 20),
                     alignment: Alignment.center,
                     child: Text('배경색 테스트 하나 둘 셋',style: TextStyle(color : Colors.black),),
                     decoration: BoxDecoration(
                         color: Colors.black,
                         borderRadius: BorderRadius.circular(6.0),
                         border: Border.all(color: Colors.grey[200]!)
                     ),
                   ),
                   SizedBox(height:20),
                   Container(
                     alignment: Alignment.center,
                     child: Text('글자 색으로는 밝은색 배경에 쓰시는것을 추천 드립니다!',textAlign: TextAlign.center,),
                   )
                 ],
               ),
             )



            ],
          ),
          SizedBox(width: 60,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('색상별 코드 보기'),
              SizedBox(height:20),
              Container(
                width: 400,
                height: 500,
                child :  GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: (20 / 8),
                  children: gridItems.map((data) =>
                      GestureDetector(
                          onTap: (){},
                          child: Container(width: 200,height: 40,
                              margin:EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                              color: Colors.grey[200]!,
                              child: Center(
                                  child: Text(data,
                                      style: TextStyle(fontSize: 20, color: Colors.black),
                                      textAlign: TextAlign.center)
                              )))

                  ).toList(),
                ),)
            ],
          )
        ],
      )
    );
  }

}