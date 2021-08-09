import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class DataSaveToast extends StatelessWidget{
  DataSaveToast({required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.save,color: Colors.black,size: 30,),
          SizedBox(
            width: 12.0,
          ),
          Text(title,style: AppThemes.textTheme.bodyText1,),
        ],
      ),
    );
  }

}