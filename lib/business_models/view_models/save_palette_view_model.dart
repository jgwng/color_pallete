import 'package:colorpallete/business_models/models/palette.dart';
import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final savePaletteInfo = ChangeNotifierProvider((ref) => serviceLocator<SavePaletteInfoModel>());

class SavePaletteInfoModel extends ChangeNotifier{
  static final UserPalette userPalette = UserPalette();
  UserPalette baseUserPalette = userPalette;
  final  database = serviceLocator.get<FBDatabaseService>();
  final  model = serviceLocator.get<PaletteViewModel>();


  void setPalette(){
    List<String> valueList = [];
    List<Color> colorList = model.basePalette;
    for(int i=0;i<colorList.length;i++){
      String value = colorList[i].value.toRadixString(16).toUpperCase();
      valueList.add(value);
      print(value);
    }
    baseUserPalette.colorCodeList = valueList;
    notifyListeners();
  }


  void setPaletteMemo(String text){
    baseUserPalette.memo = text;
    notifyListeners();
  }

  void setPaletteName(String text){
    baseUserPalette.name = text;
    notifyListeners();
  }

  void savePalette(BuildContext context) async{

  }




}