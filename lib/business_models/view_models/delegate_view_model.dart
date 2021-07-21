import 'package:colorpallete/business_models/navigator/palette_router.dart';
import 'package:colorpallete/business_models/navigator/ui_pages.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final delegateState = ChangeNotifierProvider((ref) => serviceLocator<DelegateViewModel>());

class DelegateViewModel extends ChangeNotifier{

  static final PaletteRouterDelegate defaultDelegateState = PaletteRouterDelegate();

  PaletteRouterDelegate baseDelegate = defaultDelegateState;

  void init() {
    baseDelegate.setNewRoutePath(MainPageConfig);
    notifyListeners();
  }

  void movePage(PageConfiguration pageConfiguration){
    baseDelegate.addPage(pageConfiguration);
    notifyListeners();
  }

  void popPage(){
    baseDelegate.popRoute();
    notifyListeners();
  }

  void fetchAdmin(String uid) async{

    notifyListeners();
  }

  void replacePage(PageConfiguration pageConfiguration){
    baseDelegate.replace(pageConfiguration);
    notifyListeners();
  }

}