import 'package:colorpallete/ui/widget/color_code_copy_toast.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaletteIconItem extends StatefulWidget{
  PaletteIconItem({required this.index});
  final int index;
  @override
  _PaletteIconItemState createState() => _PaletteIconItemState();
}

class _PaletteIconItemState extends State<PaletteIconItem>{
  FToast? fToast;
//  final provider = serviceLocator.get<DelegateViewModel>();

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
          onPressed: () {
            fToast!.showToast(
              child: CodeCopyToast(),
              gravity: ToastGravity.BOTTOM,
              toastDuration: Duration(seconds: 2),
            );

            // Custom Toast Position
          },
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
        icon = Icons.grid_on_rounded;
        break;
      case 2:
        icon = Icons.star_border_outlined;
        break;
      case 3:
        icon = Icons.sync_alt_rounded;
        break;
      case 4:
        icon = Icons.content_copy_rounded;
        break;
      case 5:
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
}