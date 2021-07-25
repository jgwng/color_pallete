import 'package:colorpallete/ui/views/palette_page/local_widget/palette_icon_item.dart';
import 'package:flutter/material.dart';

class PaletteItem extends StatefulWidget{

  PaletteItem({required this.onEnter,required this.onExit,required this.onHovering,required this.index});
  final VoidCallback onEnter;
  final VoidCallback onExit;
  final VoidCallback onHovering;
  final int index;


  @override
  _PaletteItemState createState() => _PaletteItemState();
}

class _PaletteItemState extends State<PaletteItem>{
  @override
  Widget build(BuildContext context) {
   return  Expanded(
     flex: 1,
     child: MouseRegion(
       onEnter: (PointerEvent details) =>widget.onEnter(),
       onExit: (PointerEvent details) =>widget.onExit(),
       onHover: (PointerEvent details) =>widget.onHovering(),
       cursor: SystemMouseCursors.click,
       child : Container(
         alignment: Alignment.center,
         color: Colors.red,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           mainAxisSize: MainAxisSize.max,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Opacity(
               opacity: (widget.index == 5) ? 1 : 0,
               child: Column(
                 children: [
                   PaletteIconItem(index : 0),
                   SizedBox(height:20),
                   PaletteIconItem(index :1),
                   SizedBox(height:20),
                   PaletteIconItem(index :2),
                   SizedBox(height:20),
                   PaletteIconItem(index :3),
                   SizedBox(height:20),
                   PaletteIconItem(index :4),
                   SizedBox(height:20),
                   PaletteIconItem(index :5),
                   SizedBox(height:100),

                 ],
               ),
             ),
             Text('${Colors.red.value.toRadixString(16).substring(2).toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(
                 color : (Colors.red.computeLuminance() <=0.5) ? Colors.white : Colors.black,fontFamily: 'SpoqaHanSansNeo',fontSize:30,
                 fontWeight: FontWeight.w700
             ),)
           ],
         ),
       ),
     ),
   );
  }

}