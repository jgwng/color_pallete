import 'package:colorpallete/ui/widget/dialog/palette_detail_dialog/local_widget/select_list_item.dart';
import 'package:flutter/material.dart';

class PaletteColorList extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 80,
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            SelectListItem(index: 0),
            SelectListItem(index: 1),
            SelectListItem(index: 2),
            SelectListItem(index: 3),
            SelectListItem(index: 4),
          ],
        ),
      ),
    );
  }

}