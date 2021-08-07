import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/dialog/palette_detail_dialog/local_widget/palette_preview_item.dart';
import 'package:flutter/material.dart';

class PalettePreviewTotal extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal : 24),
        child : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('팔레트 미리 보기',style : AppThemes.textTheme.bodyText1),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                    PalettePreviewItem(index: 0),
                    PalettePreviewItem(index: 1),
                    PalettePreviewItem(index: 2),
                    PalettePreviewItem(index: 3),
                    PalettePreviewItem(index: 4),
                  ]
              ),
            )
          ],
        )
    );
  }

}