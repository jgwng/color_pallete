import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:flutter/material.dart';

class SaveDialogBottom extends StatelessWidget{
  SaveDialogBottom({required this.buttonTitle, required this.onPressed});
  final String buttonTitle;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,vertical : 15),
          child: Divider(height:1,thickness: 1,color: Colors.grey[200],),
        ),
        StandardButton(buttonTitle: buttonTitle,onPressed: onPressed,hMargin:24,vMargin: 0,),
        SizedBox(height:25),
      ],
    );
  }

}