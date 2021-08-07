import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/dialog/local_widget/color_label_TFT.dart';
import 'package:colorpallete/ui/widget/dialog/palette_detail_dialog/local_widget/palette_preview_total.dart';
import 'package:colorpallete/ui/widget/dialog/save_dialog/save_dialog_bottom.dart';
import 'package:colorpallete/ui/widget/dialog/save_dialog/save_dialog_title.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaletteSaveDialog extends StatefulWidget{
 @override
  _PaletteSaveDialogState createState() => _PaletteSaveDialogState();
}

class _PaletteSaveDialogState extends State<PaletteSaveDialog>{
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
    return Consumer(
      builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
        var model = watch(paletteInfo);
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          child: Container(
            width: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SaveDialogTitle(title :'팔레트 저장하기' ),
                ColorLabelTFT(label : '팔레트 이름', controller : nameController!,node : nameNode!),
                ColorLabelTFT(label : '간단 메모', controller : memoController!,node : memoNode!),
                SizedBox(height:20),
                PalettePreviewTotal(),
                SaveDialogBottom(buttonTitle: '팔레트 저장하기',onPressed: (){})
              ],
            ),
          ),
        );
      },
    );

  }




  Widget paletteViewItem(PaletteViewModel model, int index){
    return Container(
        width: 60,height: 50,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular((index == 0) ? 5 : 0),
            bottomLeft: Radius.circular((index == 0) ? 5 : 0),
            topRight: Radius.circular((index == 4) ? 5 : 0),
            bottomRight: Radius.circular((index == 4) ? 5 : 0)
        ),
        color: model.basePalette[index],
      ),

    );
  }


}
