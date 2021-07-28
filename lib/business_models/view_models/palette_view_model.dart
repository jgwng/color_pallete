import 'package:colorpallete/service/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;

final paletteInfo = ChangeNotifierProvider((ref) => serviceLocator<PaletteViewModel>());

class PaletteViewModel extends ChangeNotifier{
  static final List<Color> colorList  = [Colors.red,Colors.blue,Colors.white,Colors.green,Colors.orange];
  List<Color> basePalette = colorList;

  void changePalette(){
    basePalette.shuffle();
    setAddress();
    notifyListeners();
  }

  void setAddress(){
    String address = '';
    for(int i = 0;i<basePalette.length;i++){
      String colorValue = basePalette[i].value.toRadixString(16).substring(2).toUpperCase();
      address += colorValue + ((i != basePalette.length-1) ? '-' : '');
    }
    html.window.history.pushState(null, 'home', address);
  }

  void deleteItem(int index){
    basePalette.removeAt(index);
    setAddress();
    notifyListeners();
  }

  void replaceItem(){

  }

}