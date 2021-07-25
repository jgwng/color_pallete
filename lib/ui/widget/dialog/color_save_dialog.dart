import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorSaveDialog extends StatefulWidget{
  @override
  _ColorSaveDialogState createState() => _ColorSaveDialogState();
}

class _ColorSaveDialogState extends State<ColorSaveDialog>{
  TextEditingController? nameController;
  TextEditingController? memoController;

  FocusNode? nameNode;
  FocusNode? memoNode;
  FocusNode? dialogNode;

  @override
  void initState(){
    super.initState();
    nameController = TextEditingController();
    memoController = TextEditingController();

    nameNode = FocusNode();
    memoNode = FocusNode();
    dialogNode = FocusNode();
  }




  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        autofocus: true,
        focusNode: dialogNode!,
        onKey: (event){
      if(event.isKeyPressed(LogicalKeyboardKey.escape)){
        Navigator.pop(context);
      }
    },
    child: Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                    child: Text('색상값 저장하기',style: TextStyle(fontFamily: 'SpoqaHanSansNeo'),),
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
            colorTFT('색상 이름'),
            colorTFT('간단 메모'),
            SizedBox(height:20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 24),
              child : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('색상값',style : TextStyle(fontFamily: 'SpoqaHanSansNeo')),
                  Container(
                    width: 100,
                    height: 40,
                    decoration : BoxDecoration(
                      color: Colors.pink,
                      borderRadius : BorderRadius.circular(6.0)
                    ),
                    alignment: Alignment.center,
                    child : Text('0x${Colors.pink.value.toRadixString(16).toUpperCase()}',style: TextStyle(color:Colors.white,fontFamily: 'SpoqaHanSansNeo',fontSize: 14),)
                  ),

                ],
              )
            ),
            SizedBox(height:10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical : 15),
              child: Divider(height:1,thickness: 1,color: Colors.grey[200],),
            ),
            StandardButton(buttonTitle: '색상값 저장하기',onPressed: (){},hMargin:24,vMargin: 0,),
            SizedBox(height:25),
          ],
        ),
      ),
    ));
  }

  Widget colorTFT(String label){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(top: 20,bottom: 20,left:24),
            child:  Text('$label',textAlign: TextAlign.left,style:TextStyle(fontFamily: 'SpoqaHanSansNeo'))
        )
        ,Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 24),
            height: 40,
            child: TextField(
              controller: (label == '색상 이름') ? nameController : memoController,
              focusNode: (label == '색상 이름') ? nameNode : memoNode,
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