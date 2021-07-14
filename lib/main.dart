import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;
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

class _MyHomePageState extends State<MyHomePage>  {

  List<Color> colorList = [Colors.red,Colors.blue,Colors.white,Colors.green,Colors.orange];
  int currentIndex = -1;
  static final appContainer =
  html.window.document.getElementById('app-container');
  FocusNode? focusNode;


  @override
  initState() {
    super.initState();
    focusNode = FocusNode();


  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: focusNode!,
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
        body: GestureDetector(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              colorItem(0),
              colorItem(1),
              colorItem(2),
              colorItem(3),
              colorItem(4),
            ],
          ),
        ),
        ),
      );
  }

  Widget colorItem(int index){
    return   Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.center,
        color: colorList[index],
        child:MouseRegion(
          onEnter: (PointerEvent details) =>_onEnter(index),
          onExit: (PointerEvent details) =>_onExit(index),
          cursor: SystemMouseCursors.click,
         child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Opacity(
                opacity: (index == currentIndex) ? 1 : 0,
                child: Column(
                  children: [
                    listIconItem(Icons.clear),
                    SizedBox(height:20),
                    listIconItem(Icons.grid_on_rounded),
                    SizedBox(height:20),
                    listIconItem(Icons.star_border_outlined),
                    SizedBox(height:20),
                    listIconItem(Icons.sync_alt_rounded),
                    SizedBox(height:20),
                    listIconItem(Icons.content_copy_rounded),
                    SizedBox(height:20),
                    listIconItem(Icons.lock_open_sharp),
                    SizedBox(height:100),

                  ],
                ),
              ),
              Text('${colorList[index].value.toRadixString(16).substring(2).toUpperCase()}',textAlign: TextAlign.center,style: TextStyle(
                  color : (colorList[index].computeLuminance() <=0.5) ? Colors.white : Colors.black 
              ),)
            ],
          ),
        ),
      ),
    );
  }


  Widget listIconItem(IconData icon){
    return Tooltip(
      message: 'Clear Icon',
      child: MouseRegion(
        onEnter: (details) => print('icon enter'),
        onExit: (details) => print('icon exit'),
        child: IconButton(
          onPressed: () => print('pressed'),
          icon: Icon(icon ,size: 30,),
        ),
      ),
      preferBelow: false,
    );
  }


  void _onEnter(int index){
    if(index != currentIndex){
      setState(() {
        currentIndex = index;
      });
    }
  }

  void _onExit(int index){
    setState(() {
      currentIndex = -1;
    });
  }




}
