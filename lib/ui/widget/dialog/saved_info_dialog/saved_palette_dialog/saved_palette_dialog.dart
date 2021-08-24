import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/widget/dialog/saved_info_dialog/saved_palette_dialog/local_widget/palette_item_info.dart';
import 'package:colorpallete/ui/widget/dialog/saved_info_dialog/saved_palette_dialog/local_widget/palette_memo_info.dart';
import 'package:colorpallete/ui/widget/dialog/saved_info_dialog/saved_palette_dialog/local_widget/palette_name_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SavedPaletteDialog extends StatefulWidget{
  SavedPaletteDialog({required this.isMulti});
  final bool isMulti;

  @override
  _SavedPaletteDialogState createState() => _SavedPaletteDialogState();
}

class _SavedPaletteDialogState extends State<SavedPaletteDialog>{


  int? currentIndex;
  List<Color>? colorList;
  List<String>? colorKindList;

  @override
  void initState(){
    super.initState();

    currentIndex = 0;
    colorList = [Colors.red,Colors.blue,Colors.green,Colors.indigo,Colors.black];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      child: Container(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height:20),
            PaletteNameInfo(name : 'aaaaaa'),
            SizedBox(height:20),
            PaletteMemoInfo(memo : 'aaa'),
            SizedBox(height:20),
            Padding(
            padding: EdgeInsets.symmetric(horizontal : 24),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('색상값',style : AppThemes.textTheme.subtitle2!.copyWith(fontWeight : FontWeight.w700)),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child : GestureDetector(
                    onTap: () => Clipboard.setData(ClipboardData(text: '0x${colorList![currentIndex!].value.toRadixString(16).toUpperCase()}')),
                    child: Container(
                        width: 100,
                        height: 40,
                        decoration : BoxDecoration(
                            color: colorList![currentIndex!],
                            borderRadius : BorderRadius.circular(6.0)
                        ),
                        alignment: Alignment.center,
                        child : Text('0x${colorList![currentIndex!].value.toRadixString(16).toUpperCase()}',style: TextStyle(
                            color:(colorList![currentIndex!].computeLuminance() <=0.5) ? Colors.white : Colors.black,fontFamily: 'SpoqaHanSansNeo',fontSize: 14),)
                    ),
                  )
                ),
              ],
            )),
            (widget.isMulti) ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 24,vertical: 20),
              child: Row(
                children: List.generate(5,(index) => PaletteItemInfo(index: index,currentIndex: currentIndex!,onPressed: () => onPressed(index) ,))
              ),
            ) : SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  void onPressed(index){
    setState(() {
      currentIndex = index;
    });
  }
}