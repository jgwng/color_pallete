import 'package:colorpallete/business_models/view_models/save_palette_view_model.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/dialog/local_widget/color_label_TFT.dart';
import 'package:colorpallete/ui/widget/dialog/palette_detail_dialog/local_widget/palette_preview_total.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/save_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/info_save_dialog/save_dialog_title.dart';
import 'package:flutter/material.dart';

class PaletteSaveDialog extends StatefulWidget{
 @override
  _PaletteSaveDialogState createState() => _PaletteSaveDialogState();
}

class _PaletteSaveDialogState extends State<PaletteSaveDialog>{

  final model = serviceLocator.get<SavePaletteInfoModel>();

  @override
  void initState(){
    super.initState();
    model.setPalette();
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
            SaveDialogTitle(title :'팔레트 저장하기'),
            ColorLabelTFT(label : '팔레트 이름',onChanged: (String text) => model.setPaletteName(text)),
            ColorLabelTFT(label : '간단 메모',onChanged: (String text) => model.setPaletteMemo(text)),
            SizedBox(height:20),
            PalettePreview(),
            SaveDialogBottom(isColor: false)
          ],
        ),
      ),
    );

  }

}
