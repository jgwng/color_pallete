import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Color> colorList = [Colors.red,Colors.blue,Colors.white,Colors.green,Colors.orange];


  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event){
        if(event.isKeyPressed(LogicalKeyboardKey.space)){
          setState(() {
           colorList.shuffle();
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(flex: 1, child: Container(
                color: colorList[0],
              ),),
              Flexible(flex: 1, child: Container(
                color: colorList[1],
              ),),
              Flexible(flex: 1, child: Container(
                color: colorList[2],
              ),),
              Flexible(flex: 1, child: Container(
                color: colorList[3],
              ),),
              Flexible(flex: 1, child: Container(
                color: colorList[4],
              ),)

            ],
          ),
        ),
      );
  }
}
