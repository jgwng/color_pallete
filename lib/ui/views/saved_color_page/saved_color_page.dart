import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/palette_page/local_widget/login_bar.dart';
import 'package:colorpallete/ui/views/saved_color_page/local_widget/saved_palette_item.dart';
import 'package:colorpallete/ui/views/saved_color_page/local_widget/select_tab_item.dart';
import 'package:flutter/material.dart';

class SavedColorPage extends StatefulWidget{
  @override
  _SavedColorPageState createState() => _SavedColorPageState();
}

class _SavedColorPageState extends State<SavedColorPage>{

  int index = 1;
  bool isColor = true;
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Column(
       children: [
         PaletteLoginBar(),
         SizedBox(height: 20,),
         Container(
           padding: EdgeInsets.symmetric(horizontal: 30),
           child:  Row(
             children: [
               SelectTabItem(title: '색상별',onPressed: () => onPressed(true),isColor: isColor,),
               SelectTabItem(title: '팔레트별',onPressed: () => onPressed(false),isColor: !isColor,),
               Spacer(),
               Text('aaaa님',style: AppThemes.textTheme.headline2,)
             ],
           ),
         ),
         SizedBox(height: 50),
         Flexible(
           child: Padding(
             padding: EdgeInsets.only(left: 30,right: 30,bottom: 20),
            child: GridView.builder(
                itemCount: 8,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30,crossAxisSpacing: 30,
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return SavedPaletteItem(palette: [Colors.red],isColor:isColor ,);
                }),
           ),
         ),
        Container(
          height: 60,
          width: double.infinity,
          padding: EdgeInsets.only(right: 40,bottom: 20),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios,size: 25,),
                onPressed: onPressedForBefore,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('$index',style : AppThemes.textTheme.headline1),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios,size: 25,),
                onPressed: onPressedForNext,
              ),
            ],
          ),
        )
       ],
     ),
   );
  }
  
  void onPressedForNext(){
    setState(() {
      index += 1;
    });
  }

  void onPressedForBefore(){
    setState(() {
      if(index != 1)
      index -= 1;
    });
  }

  void onPressed(bool value){
    setState(() {
      isColor = value;
    });
  }
  
  
}