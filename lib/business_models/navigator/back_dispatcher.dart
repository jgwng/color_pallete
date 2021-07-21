import 'package:colorpallete/business_models/navigator/palette_router.dart';
import 'package:flutter/cupertino.dart';

class PaletteBackDispatcher extends RootBackButtonDispatcher{
  final PaletteRouterDelegate _routerDelegate;

  PaletteBackDispatcher(this._routerDelegate)
      : super();


  @override
  Future<bool> didPopRoute(){
    return _routerDelegate.popRoute();
  }
}