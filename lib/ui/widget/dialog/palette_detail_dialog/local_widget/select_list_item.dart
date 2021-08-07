import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectListItem extends StatelessWidget{
  SelectListItem({required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, T Function<T>(ProviderBase<Object?, T>) watch, Widget? child) {
        var model = watch(paletteInfo);
        return  Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () => model.selectItem(index),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((index == 0) ? 5 : 0),
                      bottomLeft: Radius.circular((index == 0) ? 5 : 0),
                      topRight: Radius.circular((index == 4) ? 5 : 0),
                      bottomRight: Radius.circular((index == 4) ? 5 : 0)
                  ),
                  color: model.basePalette[index],
                ),
                alignment: Alignment.center,
                child: Icon(Icons.circle,size: 10,color:(index == model.selectIndex)  ? Colors.white : Colors.transparent,),
              )
          ),
        );
      },
    );
  }

}