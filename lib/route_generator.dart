import 'package:colorpallete/main.dart';
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
    }else{
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
           return MyHomePage();
         case 'error':
           return Container(color: Colors.red,);
         case '1':
           return Container(color: Colors.blue);
         default:
           return MyHomePage();
       }
      },
      settings: settings,
    );
  }
}