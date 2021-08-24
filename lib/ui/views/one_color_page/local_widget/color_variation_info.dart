import 'package:color_models/color_models.dart';
import 'package:colorpallete/const/app_themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorVariationInfo extends StatefulWidget{
  ColorVariationInfo({required this.colorValue});
  final String colorValue;
  @override
  _ColorVariationInfoState createState() => _ColorVariationInfoState();

}

class _ColorVariationInfoState extends State<ColorVariationInfo>{
  List<ColorModel>? paletteBlackList;
  List<ColorModel>? paletteWhiteList;


  @override
  void initState(){
    super.initState();

    var palette = <ColorModel>[
      RgbColor(255, 0, 0),
      RgbColor(0, 0, 0),
    ];

// [RgbColor(255, 0, 0), RgbColor(128, 128, 0), RgbColor(0, 255, 0), RgbColor(0, 128, 128), RgbColor(0, 0, 255)]
    paletteBlackList = palette.augment(10);
     palette = <ColorModel>[
      RgbColor(255, 0, 0),
      RgbColor(255, 255, 255),
    ];
    paletteWhiteList = palette.augment(10);
  }



  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          colorList('색상 밝게 조절', 0),
          SizedBox(height: 30,),
          colorList('색상 어둡게 조절', 1),
          SizedBox(height: 30,),
          colorBnWList('색상 어둡게 조절', 0),
          SizedBox(height: 30,),
          colorBnWList('색상 어둡게 조절', 1),
        ],
      )
    );
  }

  Widget colorList(String text, int index){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20,),
        Text(text,style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700),),
        SizedBox(height: 50,),
        SizedBox(
            width: 800,height: 60,
            child:  ListView.builder(
              itemBuilder: (ctx,i) =>  colorItem(i,(index == 0) ? true : false),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    );
  }

  Widget colorItem(int index,bool isCooler){
    final orange = RgbColor(255, 144, 0);
    int value = 5;
    print(value*index);
    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        // Changing the width and height
        width: isExpanded ? 100 : 80,
        // Decoration Portion of the Container
        decoration: BoxDecoration(
            color:Color.fromRGBO(isCooler ? orange.cooler(value*(index+1)).red : orange.warmer(value*(index+1)).red, isCooler ? orange.cooler(value*(index+1)).green : orange.warmer(value*(index+1)).green,isCooler ? orange.cooler(value*(index+1)).blue : orange.warmer(value*(index+1)).blue, 1.0),
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
        SizedBox(height: 20,),
        Text(text,style: AppThemes.textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w700),),
        SizedBox(height: 50,),
        SizedBox(
            width: 800,height: 60,
            child:  ListView.builder(
              itemBuilder: (ctx,i) =>  colorBnWItem(i,(index == 0) ? true : false),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
            )),
      ],
    );
  }

  Widget colorBnWItem(int index,bool isCooler){

    return  GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        // Changing the width and height
        width: isExpanded ? 100 : 80,
        // Decoration Portion of the Container
        decoration: BoxDecoration(
            color:Color.fromRGBO(isCooler ? paletteBlackList![index].toRgbColor().red : paletteWhiteList![index].toRgbColor().red, isCooler ? paletteBlackList![index].toRgbColor().green : paletteWhiteList![index].toRgbColor().green,isCooler ? paletteBlackList![index].toRgbColor().red : paletteWhiteList![index].toRgbColor().red, 1.0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular((index == 0) ? 8 : 0),
                bottomLeft: Radius.circular((index == 0) ? 8 : 0),
                topRight: Radius.circular((index == 9) ? 8 : 0),
                bottomRight: Radius.circular((index == 9) ? 8 : 0)
            )),
      ),
    );
  }

}