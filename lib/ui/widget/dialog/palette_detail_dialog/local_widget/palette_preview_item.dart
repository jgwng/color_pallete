import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PalettePreviewItem extends StatelessWidget{
  PalettePreviewItem({required this.index});
  final int index;


  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
        var model = watch(paletteInfo);
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
      },

    );
  }

}