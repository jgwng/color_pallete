import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:colorpallete/service/dialog/show_dialog.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/color_code_copy_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaletteIconItem extends StatefulWidget{
  PaletteIconItem({required this.index,required this.listIndex});
  final int index,listIndex;
  @override
  _PaletteIconItemState createState() => _PaletteIconItemState();
}

class _PaletteIconItemState extends State<PaletteIconItem>{
  FToast? fToast;
  final provider = serviceLocator.get<PaletteViewModel>();

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast!.init(context);
  }




  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: toolTipText(widget.index),
      textStyle: TextStyle(fontSize: 10,color: Colors.white),
      child: MouseRegion(
        onEnter: (details) => print('icon enter'),
        onExit: (details) => print('icon exit'),
        child: IconButton(
          onPressed: () => onPressed(widget.index),
          icon: listIcon(widget.index),
        ),
      ),
      preferBelow: false,
    );
  }

  Widget listIcon(int index){
    IconData? icon;
    switch(index){
      case 0:
        icon = Icons.clear;
        break;
      case 1:
        icon = Icons.star_border_outlined;
        break;
      case 2:
        icon = Icons.sync_alt_rounded;
        break;
      case 3:
        icon = Icons.content_copy_rounded;
        break;
      case 4:
        icon = Icons.lock_open_sharp;
        break;
    }
    return Icon(icon,size: 30,color: Colors.black,);
  }

  String toolTipText(int index){
    switch(index){
      case 0:
        return '';
      case 1:
        return '';
      case 2:
        return '';
      case 3:
        return '';
      case 4:
        return '';
      case 5:
        return '';
    }
    return '';
  }

  void onPressed(int index){
    switch(index){
      case 0:
        provider.deleteItem(widget.listIndex);
        break;
      case 1:
        showColorSaveDialog(context);
        break;
      case 3:
        print('${provider.basePalette[widget.listIndex].value.toRadixString(16)}');
//        Clipboard.setData(ClipboardData(text: "${colorValue(index)}"));
        fToast!.showToast(
          child: CodeCopyToast(title: '색상값 복사완료!',),
          gravity: ToastGravity.BOTTOM,
          toastDuration: Duration(seconds: 2),
        );
        break;
      default:
        provider.deleteItem(widget.listIndex);
        break;
    }


  }
}