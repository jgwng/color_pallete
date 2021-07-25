import 'package:colorpallete/const/app_themes.dart';
import 'package:colorpallete/ui/views/home_page/local_widget/coloors_button.dart';
import 'package:colorpallete/ui/views/home_page/local_widget/home_page_text.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
//  final provider = serviceLocator.get<DelegateViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          image: DecorationImage(
            image: AssetImage('assets/images/home_page.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height:40),
           HomePageText(),
           SizedBox(height:120),
           Text('본 사이트는 Coolors사이트를 클론한 사이트임을 알려드립니다',style:  AppThemes.textTheme.subtitle2!.copyWith(color: Colors.white),),
           SizedBox(height: 20,),
           CoolorsButton()
         ],
        ),
      ),
    );
  }

}