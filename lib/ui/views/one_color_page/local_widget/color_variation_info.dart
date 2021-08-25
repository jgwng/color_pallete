import 'package:color_models/color_models.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/utils/set_color_value.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorVariationInfo extends StatefulWidget{
  ColorVariationInfo({required this.colorValue});
  final String colorValue;
  @override
  _ColorVariationInfoState createState() => _ColorVariationInfoState();

}

class _ColorVariationInfoState extends State<ColorVariationInfo>{
  List<ColorModel>? paletteBlackList;
  List<ColorModel>? paletteWhiteList;
  Color? valueColor;
  RgbColor? color;

  @override
  void initState(){
    super.initState();
     valueColor = Color(int.parse('FF${widget.colorValue}', radix: 16));
     color = RgbColor(valueColor!.red,valueColor!.green,valueColor!.blue);
    var palette = <ColorModel>[
      color!,
      RgbColor(0, 0, 0),
    ];

// [RgbColor(255, 0, 0), RgbColor(128, 128, 0), RgbColor(0, 255, 0), RgbColor(0, 128, 128), RgbColor(0, 0, 255)]
    paletteBlackList = palette.augment(10);

     palette = <ColorModel>[
       color!,
      RgbColor(255, 255, 255),
    ];
    paletteWhiteList = palette.augment(10);

  }

  int selectedIndex = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            colorList('색상 밝게 조절', 0),
            SizedBox(height: 30,),
            colorList('색상 어둡게 조절', 1),
            SizedBox(height: 30,),
            colorBnWList('색상 밝게 조절', 0),
            SizedBox(height: 30,),
            colorBnWList('색상 어둡게 조절', 1),
          ],
        ),)
    );
  }



  Widget colorList(String text, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20,bottom: 50),
          child: Text(text,style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700),),
        ),
        SizedBox(
            width: double.infinity,height: 60,
            child:  ListView.builder(
              itemBuilder: (ctx,i) =>  colorItem(i,(index == 0) ? true : false),
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    );
  }

  Widget colorItem(int index,bool isCooler){
    int value = 10;
    String hex = isCooler ? color!.cooler(value*(index+1)).hex : color!.warmer(value*(index+1)).hex;
    String hexcode = hex.replaceAll('#','FF');
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Clipboard.setData(ClipboardData(text:hexcode)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        // Changing the width and height
        width: (selectedIndex == index) ?(MediaQuery.of(context).size.width-160)/10+20 : (MediaQuery.of(context).size.width-160)/10,
        // Decoration Portion of the Container
        decoration: BoxDecoration(
            color:Color(int.parse(hexcode, radix: 16)),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular((index == 0) ? 8 : 0),
              bottomLeft: Radius.circular((index == 0) ? 8 : 0),
              topRight: Radius.circular((index == 9) ? 8 : 0),
              bottomRight: Radius.circular((index == 9) ? 8 : 0)
        )),
      ),
    );
  }


  Widget colorBnWList(String text, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20,bottom: 50),
          child: Text(text,style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700)),
        ),
        Container(
            width: MediaQuery.of(context).size.width-160,height: 60,
            child:  ListView.builder(
              itemBuilder: (ctx,i) =>  colorBnWItem(i,(index == 0) ? true : false),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    );
  }

  Widget colorBnWItem(int index,bool isCooler){
    String hexcode = isCooler ? paletteBlackList![index].hex :  paletteWhiteList![index].hex;
    String hex = hexcode.replaceAll('#','FF');
    hexcode = hexcode.replaceAll('#','');
    double width = MediaQuery.of(context).size.width-160;
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Clipboard.setData(ClipboardData(text:hex)),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        // Changing the width and height
        width:  (selectedIndex == -1) ? width/10 : ((selectedIndex == index) ? width/10+20 :width/10-20/9),
        alignment: Alignment.center,
        // Decoration Portion of the Container
        decoration: BoxDecoration(
            color: Color(int.parse(hex, radix: 16)),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular((index == 0) ? 8 : 0),
                bottomLeft: Radius.circular((index == 0) ? 8 : 0),
                topRight: Radius.circular((index == 9) ? 8 : 0),
                bottomRight: Radius.circular((index == 9) ? 8 : 0)
            )),
        child: MouseRegion(
          onEnter: (event) => _onEnter(index),
          onExit: (event) => _onExit(index),
          onHover: (event) => _onHovering(index),
          child: Text('${hexcode.toUpperCase()}',style: AppThemes.textTheme.bodyText1!.copyWith(
              color: (selectedIndex == index) ? setTextColor(Color(int.parse(hex, radix: 16))) : Colors.transparent)),
        ),
      ),
    );
  }
  void _onEnter(int index){
    if(index != selectedIndex){
      setState(() {
        selectedIndex = index;
      });
    }
  }

  void _onExit(int index){
    setState(() {
      selectedIndex = -1;
    });
  }

  void _onHovering(int index){
    if(index != selectedIndex){
      setState(() {
        selectedIndex = index;
      });
    }
  }

}