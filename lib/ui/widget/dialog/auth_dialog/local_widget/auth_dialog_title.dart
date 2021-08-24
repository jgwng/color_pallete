import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthDialogTitle extends StatelessWidget{
  AuthDialogTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(top: 10,left: 10,right: 10),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            splashColor: Colors.transparent,
            icon: Icon(Icons.close),
          ),
        ),
        Center(
          child: Text(title,style: TextStyle(fontFamily: 'SpoqaHanSansNeo',fontWeight : FontWeight.w700,fontSize: 20),),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15,bottom: 10),
          child: Divider(color: Colors.grey[200],height: 1,thickness: 1),
        )
      ],
    );
  }

}