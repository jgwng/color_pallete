import 'package:colorpallete/business_models/navigator/ui_pages.dart';
import 'package:flutter/cupertino.dart';

class PaletteParser extends RouteInformationParser<PageConfiguration>{
  @override
  Future<PageConfiguration> parseRouteInformation(RouteInformation routeInformation) async{
    final uri = Uri.parse(routeInformation.location!);
    if(uri.pathSegments.isEmpty){
      return MainPageConfig;
    }

    final path = uri.pathSegments[0];
    print('path : $path');
    switch(path){
      case MainPagePath:
        return MainPageConfig;
      case PalettePagePath:
        return PalettePageConfig;
      default:
        return MainPageConfig;
    }
  }

  @override
  RouteInformation restoreRouteInformation(PageConfiguration configuration) {
    switch (configuration.uiPage){
      case Pages.Main:
        return const RouteInformation(location: MainPagePath);
      case Pages.Error:
        return const RouteInformation(location: ErrorPagePath);
      case Pages.Generate:
        return const RouteInformation(location: PalettePagePath);
      default: return const RouteInformation(location: MainPagePath);

    }
  }

}