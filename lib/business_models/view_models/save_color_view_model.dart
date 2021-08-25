import 'package:colorpallete/business_models/models/color.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:colorpallete/ui/widget/toast/color_code_copy_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final saveColorInfo = ChangeNotifierProvider((ref) => serviceLocator<SaveColorInfoModel>());

class SaveColorInfoModel extends ChangeNotifier{
  static final UserColor userColor = UserColor();
  UserColor baseUserColor = userColor;
  bool isCompleted = false;

  final  database = serviceLocator.get<FBDatabaseService>();

  void setColor(String value){
    baseUserColor.colorCode = value;
    print(value);
    notifyListeners();
  }

  void setColorName(String? text){
    baseUserColor.name = text;
    notifyListeners();
  }

  void setColorMemo(String? text){
    baseUserColor.memo = text;
    notifyListeners();
  }

  void saveColor(BuildContext context) async{

    FToast fToast = FToast();
    fToast.init(context);

    baseUserColor.createdAt = DateTime.now();
    await database.saveColor(baseUserColor).then((value) => {
      fToast.showToast(
        child: CodeCopyToast(title: '색상값 복사완료!',),
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
      )
      });
  }

}