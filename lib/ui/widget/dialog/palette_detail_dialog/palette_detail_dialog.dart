import 'package:color_models/color_models.dart';
import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/dialog/palette_detail_dialog/local_widget/palette_color_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaletteDetailDialog extends StatefulWidget{
  @override
  _PaletteDetailDialogState createState() => _PaletteDetailDialogState();
}

class _PaletteDetailDialogState extends State<PaletteDetailDialog>{

  int? colorIndex;
  int? currentIndex;
  FocusNode? focusNode;
  List<Color>? colorList;
  List<String>? colorKindList;

  @override
  void initState(){
    super.initState();
    colorIndex = 0;
    currentIndex = -1;
    var model = serviceLocator.get<PaletteViewModel>();
    colorList = model.basePalette;
    colorKindList = ['RGB','HEX','HSB','HSL','CMYK','LAB','XYZ','HSP'];
    focusNode = FocusNode();
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
                        child: Text('팔레트 상세 정보 확인',style: TextStyle(fontFamily: 'SpoqaHanSansNeo'),),
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
                Container(
                  height: 300,
                  color: colorList![model.selectIndex],
                  child: ListView.separated(
                    separatorBuilder: (ctx,i) => Divider(height: 1,thickness: 1,color: (colorList![colorIndex!].computeLuminance() <=0.5) ? Colors.white : Colors.black,),
                    itemBuilder: (ctx,i) => colorDetailInfo(model,i),
                    itemCount: colorKindList!.length,
                    shrinkWrap: true,
                  ),
                ),
                PaletteColorList()
              ],
            ),
          ),
        );
      },
    );
  }
  Widget colorDetailInfo(PaletteViewModel model, int index){
    return  MouseRegion(
      onHover: (event) => _onHovering(index),
      onEnter: (event) => _onEnter(index),
      onExit: (event) => _onExit(index),
      child: GestureDetector(
        onTap: () => Clipboard.setData(ClipboardData(text: "${colorValue(model, index)}")),
        behavior: HitTestBehavior.opaque,
        child: Container(
            height: 70,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${colorKindList![index]}',style: TextStyle(color: (colorList![model.selectIndex].computeLuminance() <=0.5) ? Colors.white : Colors.black,fontSize: 14)),
                    SizedBox(height: 5,),
                    Text('${colorValue(model,index)}',style: TextStyle(fontFamily: 'SpoqaHanSansNeo',fontSize: 16),),
                  ],
                ),
                Text('색상값 복사하기',style: TextStyle(color: (index == currentIndex) ? ((colorList![model.selectIndex].computeLuminance() <=0.5) ? Colors.white : Colors.black) :Colors.transparent ,fontFamily: 'SpoqaHanSansNeo'))
              ],
            )),
      ),
    );
  }

  String colorValue(PaletteViewModel model, int index){
    print(model.selectIndex);
    RgbColor color = RgbColor(colorList![model.selectIndex].red,colorList![model.selectIndex].green,colorList![model.selectIndex].blue);
    switch(index){
      case 0:
        return 'RGB(${color.red},${color.green},${color.blue})';
      case 1:
        return colorList![colorIndex!].value.toRadixString(16);
      case 2:
        var newColorValue = HsbColor.from(color);
        return 'HSB(${newColorValue.hue.floor()},${newColorValue.saturation.floor()},${newColorValue.brightness.floor()})';
      case 3:
        var newColorValue = HslColor.from(color);
        return'HSL(${newColorValue.hue.floor()},${newColorValue.saturation.floor()},${newColorValue.lightness.floor()})';
      case 4:
        var newColorValue = CmykColor.from(color);
        return 'CMYK(${newColorValue.cyan.floor()},${newColorValue.magenta.floor()},${newColorValue.yellow.floor()},${newColorValue.black.floor()})';
      case 5:
        var newColorValue = LabColor.from(color);
        return 'LAB(${newColorValue.lightness.floor()},${newColorValue.a.floor()},${newColorValue.b.floor()})';
      case 6:
      //Xyz
        var newColorValue = XyzColor.from(color);
        return 'XYZ(${newColorValue.x.floor()},${newColorValue.y.floor()},${newColorValue.z.floor()})';
      case 7:
        var newColorValue =HspColor.from(color);
        return 'HSP(${newColorValue.hue.floor()},${newColorValue.saturation.floor()},${newColorValue.perceivedBrightness.floor()})';
    }
    return '';
  }

  void _onEnter(int index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }

  void _onExit(int index){
    setState(() {
      currentIndex = -1;
    });
  }

  void _onHovering(int index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }
}