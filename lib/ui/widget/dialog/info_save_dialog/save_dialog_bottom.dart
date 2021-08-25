import 'package:colorpallete/business_models/view_models/save_color_view_model.dart';
import 'package:colorpallete/business_models/view_models/save_palette_view_model.dart';
import 'package:colorpallete/ui/widget/standard_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveDialogBottom extends StatelessWidget{
  SaveDialogBottom({required this.isColor});
  final bool isColor;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ( context,  watch,  child) {
        var colorModel = watch(saveColorInfo);
        var paletteModel = watch(savePaletteInfo);
        return Container(
          margin: EdgeInsets.only(top: 20,bottom: 25),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24,vertical : 15),
                child: Divider(height:1,thickness: 1,color: Colors.grey[200],),
              ),
              StandardButton(buttonTitle: '${isColor ? '색상값' : '팔레트'} 저장하기',
                onPressed: ()=>(isColor) ? colorModel.saveColor(context) : paletteModel.savePalette(context),
                hMargin:24),
            ],
          ),
        );
      },

    );
  }

}