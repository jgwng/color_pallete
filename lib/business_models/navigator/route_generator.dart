import 'package:colorpallete/ui/views/error_page/error_page.dart';
import 'package:colorpallete/ui/views/home_page/home_page.dart';
import 'package:colorpallete/ui/views/one_color_page/one_color_page.dart';
import 'package:colorpallete/ui/views/palette_page/palette_page.dart';
import 'package:colorpallete/ui/views/saved_color_page/saved_color_page.dart';
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

    switch(route){
      case '/23AACC':
        parser = '23AACC';
        break;
      case '/main':
        parser = 'main';
        break;
      case '/palette':
        parser = 'palette';
        break;
      default:
        String newRoute = route.substring(1);
        print(newRoute);
        var splitRoute = newRoute.split('-');
        print('$splitRoute');
        List<bool> hexResult = [];
        for(int i =0; i<splitRoute.length;i++){
          hexResult.add(isHexColor(splitRoute[i]));
        }
        parser = (hexResult.contains(false)) ? 'error' : (splitRoute.length.toString());
        break;
    }

    return MaterialPageRoute(
      builder: (context) {
        switch(parser){
          case 'palette':
            return PalettePage();
          case 'error':
            return ErrorPage();
          case '23AACC':
            return OneColorPage(color: parser);
          case 'main':
            return  HomePage();
          default:
            return HomePage();
        }
      },
      settings: settings,
    );
  }
}