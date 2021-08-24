import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class SaveDialogTitle extends StatelessWidget{
  SaveDialogTitle({required this.title});
  final String title;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          child:ListTile(
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
            ),
            title: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(title,style: AppThemes.textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w700),),
              ),
            ),
            trailing: Opacity(
              opacity: 0,
              child: Icon(Icons.close),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: Divider(
            color: Colors.grey[200],height: 1,thickness: 1,
          ),
        ),
      ],
    );
  }

}