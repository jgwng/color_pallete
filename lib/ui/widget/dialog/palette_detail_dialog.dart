import 'package:color_models/color_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    colorList = [Colors.red,Colors.blue,Colors.purple,Colors.green,Colors.orange];
    colorKindList = ['RGB','HEX','HSB','HSL','CMYK','LAB','XYZ','HSP'];
    focusNode = FocusNode();
  }




  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
        autofocus: true,
        focusNode: focusNode!,
        onKey: (event){
          if(event.isKeyPressed(LogicalKeyboardKey.escape)){
            Navigator.pop(context);
          }
        },
    child:Dialog(
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
              color: colorList![colorIndex!],
              child: ListView.separated(
                separatorBuilder: (ctx,i) => Divider(height: 1,thickness: 1,color: (colorList![colorIndex!].computeLuminance() <=0.5) ? Colors.white : Colors.black,),
                itemBuilder: (ctx,i) => colorDetailInfo(i),
                itemCount: colorKindList!.length,
                shrinkWrap: true,
              ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children: [
                    selectColorList(0),
                    selectColorList(1),
                    selectColorList(2),
                    selectColorList(3),
                    selectColorList(4),
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    ));
  }
  Widget colorDetailInfo(int index){
    return  MouseRegion(
      onHover: (event) => _onHovering(index),
      onEnter: (event) => _onEnter(index),
      onExit: (event) => _onExit(index),
      child: GestureDetector(
        onTap: () => Clipboard.setData(ClipboardData(text: "${colorValue(index)}")),
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
                    Text('${colorKindList![index]}',style: TextStyle(color: (colorList![colorIndex!].computeLuminance() <=0.5) ? Colors.white : Colors.black,fontSize: 14)),
                    SizedBox(height: 5,),
                    Text('${colorValue(index)}',style: TextStyle(fontFamily: 'SpoqaHanSansNeo',fontSize: 16),),
                  ],
                ),
                Text('색상값 복사하기',style: TextStyle(color: (index == currentIndex) ? ((colorList![colorIndex!].computeLuminance() <=0.5) ? Colors.white : Colors.black) :Colors.transparent ,fontFamily: 'SpoqaHanSansNeo'))
              ],
            )),
      ),
    );
  }

  Widget selectColorList(int index){
    return Expanded(
      flex: 1,
      child: GestureDetector(
          onTap: (){
            setState(() {
              colorIndex = index;
            });
          },
          child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular((index == 0) ? 5 : 0),
                bottomLeft: Radius.circular((index == 0) ? 5 : 0),
                topRight: Radius.circular((index == 4) ? 5 : 0),
                bottomRight: Radius.circular((index == 4) ? 5 : 0)
            ),
            color: colorList![index],
          ),
            alignment: Alignment.center,
            child: Icon(Icons.circle,size: 10,color:(index == colorIndex)  ? Colors.white : Colors.transparent,),
        )
      ),
    );
  }

  String colorValue(int index){
    RgbColor color = RgbColor(colorList![0].red,colorList![0].green,colorList![0].blue);

    switch(index){
      case 0:
        return 'RGB(${color.red},${color.green},${color.blue})';
      case 1:
        return colorList![0].value.toRadixString(16);
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