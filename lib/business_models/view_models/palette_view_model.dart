import 'dart:math';
import 'package:colorpallete/service/service_locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:universal_html/html.dart' as html;

final paletteInfo = ChangeNotifierProvider((ref) => serviceLocator<PaletteViewModel>());

class PaletteViewModel extends ChangeNotifier{
  static final List<Color> colorList  = [Colors.red,Colors.blue,Colors.green,Colors.orange,Colors.redAccent,Colors.deepOrange,Colors.brown,Colors.indigo,Colors.blueGrey];
  List<Color> basePalette = colorList;
  List<dynamic> basePaletteList = [];
  List<int> lockIndex = [];
  int length = 5;
  int selectIndex = 0;
  int currentIndex = 0;

  void changePalette(){
    print('a');
    List<Color> palette = basePalette.toList();
    List<Color> colorCopyList = colorList.toList();
    final _random = new Random();
    List<Color> newPalette = [];
    if(lockIndex.length > 0)
    for(int i=0;i<lockIndex.length;i++){

      colorCopyList.remove(colorCopyList[lockIndex[i]]);
    }
    print('b');
    for(int i=0;i<length;i++){
      var element = colorCopyList[_random.nextInt(colorCopyList.length)];
      newPalette.add((lockIndex.contains(i)) ? palette[i] : element);
      colorCopyList.remove(newPalette[i]);
    }
    print('c');
    basePalette = newPalette;
    print('palette : $palette');
    print('basePalette : $basePalette');
    basePaletteList.add(basePalette);
    currentIndex +=1;
    notifyListeners();
    setAddress();

  }

  void setAddress(){
    String address = '';
    for(int i = 0;i<basePalette.length;i++){
      String colorValue = basePalette[i].value.toRadixString(16).substring(2).toUpperCase();
      address += colorValue + ((i != basePalette.length-1) ? '-' : '');
    }
    html.window.history.pushState(null, 'main', address);
  }

  void deleteItem(int index){
    basePalette.removeAt(index);
    setAddress();
    notifyListeners();
  }

  void setPreviousPalette(){
    if(currentIndex != 0){
      currentIndex -= 1;
      basePalette = basePaletteList[currentIndex];
      setAddress();
      notifyListeners();
    }
  }

  void setNextPalette(){
    if(currentIndex != basePaletteList.length-1){
      currentIndex += 1;
      basePalette = basePaletteList[currentIndex];
      setAddress();
      notifyListeners();
    }
  }

  void selectItem(int index){
    selectIndex = index;
    notifyListeners();
  }
  void lockItem(int index){
    lockIndex.contains(index) ? lockIndex.remove(index) : lockIndex.add(index);
    print('lockIndex : $lockIndex');
    notifyListeners();
  }

  void initPalette(){
    List<Color> palette = [];
    List<Color> colorCopyList = colorList.toList();
    final _random = new Random();
    for(int i=0;i<5;i++){
      var element = colorCopyList[_random.nextInt(colorCopyList.length)];
      palette.add(element);
      colorCopyList.remove(element);
    }
    basePalette = palette;
    basePaletteList.add(basePalette);
    setAddress();
    notifyListeners();
  }
}