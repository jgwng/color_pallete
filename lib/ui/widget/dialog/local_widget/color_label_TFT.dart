import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class ColorLabelTFT extends StatelessWidget{
  ColorLabelTFT({required this.label,required this.controller,required this.node});
  final TextEditingController controller;
  final FocusNode node;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20,bottom: 10,left:24),
            child:  Text('$label',textAlign: TextAlign.left,style:AppThemes.textTheme.bodyText1)
        )
        ,Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 40,
            child: TextField(
              controller: controller,
              focusNode: node,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left:10,top:10),
                  hintText: label,
                  hintStyle: AppThemes.textTheme.bodyText1!.copyWith(color: Colors.grey),
                  errorStyle: AppThemes.textTheme.bodyText2!.copyWith(color: Colors.red),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                        color: AppThemes.pointColor),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(color: Colors.black),
                  )),
            )),
      ],
    );
  }
}