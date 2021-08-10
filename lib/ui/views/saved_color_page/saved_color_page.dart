import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/palette_page/local_widget/login_bar.dart';
import 'package:flutter/material.dart';

class SavedColorPage extends StatefulWidget{
  @override
  _SavedColorPageState createState() => _SavedColorPageState();
}

class _SavedColorPageState extends State<SavedColorPage>{
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
               SizedBox(width: 20,),
               GestureDetector(
                   onTap: (){},
                   child : Container(
                     width: 80,
                     height: 40,
                     padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                     decoration: BoxDecoration(
                         border: Border(
                             bottom: BorderSide(color: Colors.blue,width: 2))
                     ),
                     alignment: Alignment.center,
                     child: Text('색상별',style: AppThemes.textTheme.bodyText1,),
                   )
               ),
               SizedBox(width: 20,),
               GestureDetector(
                   onTap: (){},
                   child : Container(
                     width: 80,
                     height: 40,
                     padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                     decoration: BoxDecoration(
                         border: Border(
                             bottom: BorderSide(color: Colors.blue,width: 2))
                     ),
                     alignment: Alignment.center,
                     child: Text('팔레트별',style: AppThemes.textTheme.bodyText1,),
                   )
               ),
               Spacer(),
               Text('aaaa님',style: AppThemes.textTheme.headline2,)
             ],
           ),
         ),
         SizedBox(height: 50),
         Flexible(
           child: Padding(
             padding: EdgeInsets.symmetric(horizontal: 30),
            child: GridView.builder(
                itemCount: 8,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30,crossAxisSpacing: 30,
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  return gridViewItem();
                }),
           ),
         ),
        Container(
          height: 80,
          width: double.infinity,
          padding: EdgeInsets.only(right: 40),
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.arrow_back_ios,size: 25,),
              SizedBox(width : 20),
              Text('1',style : AppThemes.textTheme.headline1),
              SizedBox(width : 20),
              Icon(Icons.arrow_forward_ios,size: 25,),
            ],
          ),
        )
       ],
     ),
   );
  }
  
  Widget gridViewItem(){
    return Container(
      width: 100,height: 60,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(6.0)
      ),);
    
  }
  
  
  
  
}