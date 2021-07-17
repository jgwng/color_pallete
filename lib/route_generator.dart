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
    var message =
        'generateRoute: Route $route, QueryParameters $queryParameters';
    print(message);

    print('isHex : ${isHexColor(route!)}');





    return MaterialPageRoute(
      builder: (context) {

        return MyHomePage();
      },
      settings: settings,
    );
  }
}