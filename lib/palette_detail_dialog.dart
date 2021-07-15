import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaletteDetailDialog extends StatefulWidget{
  @override
  _PaletteDetailDialogState createState() => _PaletteDetailDialogState();
}

class _PaletteDetailDialogState extends State<PaletteDetailDialog>{
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
                    child: Text('팔레트 상세 정보 확인'),
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
              color: Colors.black,
              child: ListView.builder(
                itemBuilder: (ctx,i) => colorDetailInfo(i),
                itemCount: 11,
                itemExtent: 50,
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
                    selectColorList(0,Colors.pink),
                    selectColorList(1,Colors.red),
                    selectColorList(2,Colors.blue),
                    selectColorList(3,Colors.green),
                    selectColorList(4,Colors.indigo),
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
  Widget colorDetailInfo(int index){
    return  ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 30),
      title: Text('Index : $index',style: TextStyle(color: Colors.white),),
      trailing: Text('$index',style: TextStyle(color: Colors.white),) ,
    );
  }

  Widget selectColorList(int index, Color color){
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular((index == 0) ? 5 : 0),
              bottomLeft: Radius.circular((index == 0) ? 5 : 0),
              topRight: Radius.circular((index == 4) ? 5 : 0),
              bottomRight: Radius.circular((index == 4) ? 5 : 0)
          ),
          color: color,
        ),
        alignment: Alignment.center,
        child: Icon(Icons.circle,size: 10,color: Colors.white,),
      ),
    );
  }
}