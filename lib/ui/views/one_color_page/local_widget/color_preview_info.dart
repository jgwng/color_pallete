import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/material.dart';

class ColorPreviewInfo extends StatefulWidget{
 @override
  _ColorPreviewInfoState createState() => _ColorPreviewInfoState();
}

class _ColorPreviewInfoState extends State<ColorPreviewInfo>{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('색상값',style :  AppThemes.textTheme.subtitle1!.copyWith(fontWeight : FontWeight.w700)),
        SizedBox(height: 20),
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
                Padding(
                  padding : EdgeInsets.only(left: 15,right: 20),
                  child : Text('#',style: AppThemes.textTheme.bodyText1,)
                ),
                Text('FFFFFF',style: AppThemes.textTheme.bodyText1,textAlign: TextAlign.left,)
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
          child:Text('미리 보기',style: AppThemes.textTheme.subtitle2,textAlign: TextAlign.left,),
        ),
        Container(
          width: 400,
          height:40,
          color: Colors.black,
        ),
      ],
    );
  }

}