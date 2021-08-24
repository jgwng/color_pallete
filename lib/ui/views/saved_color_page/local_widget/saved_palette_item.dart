import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/service/dialog/show_dialog.dart';
import 'package:flutter/material.dart';

class SavedPaletteItem extends StatefulWidget{
  SavedPaletteItem({required this.palette,required this.isColor});
  final List<Color> palette;
  final bool isColor;
  @override
  _SavedPaletteItemState createState() => _SavedPaletteItemState();
}

class _SavedPaletteItemState extends State<SavedPaletteItem>{
  List<Color> colorList = [Colors.red,Colors.blue,Colors.green,Colors.indigo,Colors.black];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap : ()=> showSavedPaletteDialog(context,!widget.isColor),
        child: Container(
          width: 100,height: 60,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[300]!),
              borderRadius: BorderRadius.circular(6.0)
          ),
          child: Column(
            children: [
              Expanded(flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('나의 ${widget.isColor ? '색상' : '팔레트'}',style: AppThemes.textTheme.bodyText1,maxLines: 1,overflow: TextOverflow.ellipsis,),
                      IconButton(icon : Icon(Icons.close_outlined,size: 20), onPressed: () {print('close');},
                        splashColor: Colors.transparent,hoverColor: Colors.transparent,)
                    ],
                  ),
              ),),
              Expanded(flex: 4,
                child: widget.isColor ? oneColorItem() : multiColorItem())
            ],
          ),
        ),
      ),
    );
  }

  Widget oneColorItem(){
    return Container(
      decoration: BoxDecoration(
        color: widget.palette[0],
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(6.0),
        ),
      ),
    );
  }

  Widget multiColorItem(){
    return Row(
      children: List.generate(5,(index) =>
      Expanded(child: Container(
        decoration: BoxDecoration(
          color: colorList[index],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular((index == 0) ? 6 : 0),
              bottomRight: Radius.circular((index == 4) ? 6 : 0)
          ),
        ),
      ),)),
    );
  }


}