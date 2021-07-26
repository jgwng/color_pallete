import 'package:colorpallete/ui/views/home_page/home_page.dart';
import 'package:colorpallete/ui/views/one_color_page/one_color_page.dart';
import 'package:colorpallete/ui/views/palette_page/palette_page.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    String? route;
    Map? queryParameters;
    if (settings.name != null) {
      var uriData = Uri.parse(settings.name!);
      route = uriData.path;
      queryParameters = uriData.queryParameters;
    }

    print('generateRoute: Route $route, QueryParameters $queryParameters');
    print('isHex : ${isHexColor(route!)}');


    String parser;

    if(route == '/'){
      parser = 'home';
    }else if (route == '/main'){
      parser = 'main';
    }
    else{
      String newRoute = route.substring(1);
      print(newRoute);
      var splitRoute = newRoute.split('-');
      print('$splitRoute');
      List<bool> hexResult = [];
      for(int i =0; i<splitRoute.length;i++){
        hexResult.add(isHexColor(splitRoute[i]));
      }
      parser = (hexResult.contains(false)) ? 'error' : (splitRoute.length.toString());
    }

    return MaterialPageRoute(
      builder: (context) {
        switch(parser){
          case 'home':
            return HomePage();
          case 'error':
            return Container(color: Colors.red,);
          case '1':
            return OneColorPage();
          case 'main':
            return  PalettePage();
          default:
            return PalettePage();
        }
      },
      settings: settings,
    );
  }
}