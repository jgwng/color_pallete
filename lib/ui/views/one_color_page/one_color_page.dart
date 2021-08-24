
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_code_info.dart';
import 'package:colorpallete/ui/views/one_color_page/local_widget/color_variation_info.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OneColorPage extends StatefulWidget{
  OneColorPage({this.color});
  final String? color;

  @override
  _OneColorPageState createState() => _OneColorPageState();
}

class _OneColorPageState extends State<OneColorPage>{
  final PageController pageController = PageController();
  // this is like a lock that prevent update the PageView multiple times while is
  // scrolling
  bool pageIsScrolling = false;
  num? index;
  int scrollTime = 700;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('aaaa');
//    html.window.history.pushState({ 'page_id': 1, 'user_id': 5 }, '1', '/FFFFFF');


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        // to detect swipe
        onPanUpdate: (details) {
          _onScroll(details.delta.dy * -1);
        },
        child: Listener(
          // to detect scroll
          onPointerSignal: (pointerSignal) {
            if (pointerSignal is PointerScrollEvent) {
              _onScroll(pointerSignal.scrollDelta.dy);
            }
          },
          child: PageView(
            scrollDirection: Axis.vertical,
            controller: pageController,
            physics: NeverScrollableScrollPhysics(),
            pageSnapping: true,
            children: [
              ColorCodeInfo(colorValue: 'FFFFFF',),
              ColorVariationInfo(colorValue: 'FFFFFF',),
            ],
          ),
        ),
      ),
    );
  }

  void _onScroll(double offset) async{
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {

        pageController
            .nextPage(
            duration: Duration(milliseconds: scrollTime),
            curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
        print('downViewportFraction : ${pageController.page}');
        setState(() {
          if(index !=3) index = pageController.page!+1;
        });
      } else {

        pageController
            .previousPage(
            duration: Duration(milliseconds: scrollTime),
            curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
        print('upViewportFraction : ${pageController.viewportFraction}');
        print(pageController.offset);
        setState(() {
          if(index != 0) index = pageController.page!-1;
        });
      }
    }
  }
  //   var newColorValue = CmykColor.from(color);
  //        return 'CMYK(${newColorValue.cyan.floor()},${newColorValue.magenta.floor()},${newColorValue.yellow.floor()},${newColorValue.black.floor()})';


}