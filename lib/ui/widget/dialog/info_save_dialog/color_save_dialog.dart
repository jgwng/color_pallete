import 'package:colorpallete/business_models/view_models/save_color_view_model.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/save_color_info.dart';
import 'package:colorpallete/ui/widget/dialog/local_widget/color_label_TFT.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/save_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/save_dialog_title.dart';
import 'package:flutter/material.dart';


class ColorSaveDialog extends StatefulWidget{
  ColorSaveDialog({required this.color});
  final Color color;

  @override
  _ColorSaveDialogState createState() => _ColorSaveDialogState();
}

class _ColorSaveDialogState extends State<ColorSaveDialog>{

  final model = serviceLocator.get<SaveColorInfoModel>();
  String? colorCode;


  @override
  void initState(){
    super.initState();
    colorCode = widget.color.value.toRadixString(16).toUpperCase();
    model.setColor(colorCode!);
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
            SaveDialogTitle(title :'색상값 저장하기'),
            ColorLabelTFT(label : '색상 이름',onChanged: (String text) => model.setColorName(text)),
            ColorLabelTFT(label : '간단 메모',onChanged: (String text) => model.setColorMemo(text)),
            SizedBox(height:20),
            SaveColorInfo(colorInfo : widget.color),
            SaveDialogBottom(isColor: true)
          ],
        ),
      ),
    );
  }
}