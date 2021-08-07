import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/dialog/save_dialog/save_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/save_dialog/save_dialog_title.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:flutter/material.dart';

import '../local_widget/color_label_TFT.dart';

class ColorSaveDialog extends StatefulWidget{
  ColorSaveDialog({required this.color});
  final Color color;

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
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SaveDialogTitle(title :'색상값 저장하기' ),
            ColorLabelTFT(label : '색상 이름', controller : nameController!,node : nameNode!),
            ColorLabelTFT(label : '간단 메모', controller : memoController!,node : memoNode!),
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
                      color: widget.color,
                      borderRadius : BorderRadius.circular(6.0)
                    ),
                    alignment: Alignment.center,
                    child : Text('0x${widget.color.value.toRadixString(16).toUpperCase()}',style: TextStyle(
                        color:(widget.color.computeLuminance() <=0.5) ? Colors.white : Colors.black,fontFamily: 'SpoqaHanSansNeo',fontSize: 14),)
                  ),
                ],
              )
            ),
            SaveDialogBottom(buttonTitle: '색상값 저장하기',onPressed: (){})
          ],
        ),
      ),
    );
  }

}