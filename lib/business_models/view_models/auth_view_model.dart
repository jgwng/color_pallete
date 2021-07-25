import 'package:colorpallete/business_models/models/user.dart';
import 'package:colorpallete/service/firebase/auth/fb_auth_service.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service.dart';
import 'package:colorpallete/service/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authInfo = ChangeNotifierProvider((ref) => serviceLocator<AuthViewModel>());

class AuthViewModel extends ChangeNotifier{
  static final PaletteUser webUser = PaletteUser();
  PaletteUser baseUser = PaletteUser();
  final auth = serviceLocator.get<FBAuthService>();
  final  database = serviceLocator.get<FBDatabaseService>();

  void signUpUser(String password) async{
    if((baseUser.email != null) & (baseUser.nickname != null)){
      String? result = await auth.signUp(baseUser.email!, password);
      if(result != null){
        baseUser.userUID = result;
        database.signUpUser(baseUser);
      }
    }
  }

  void setUserNickName(String nickname){
    baseUser.nickname = nickname;
    notifyListeners();

  }

  void setUserEmail(String email){
    baseUser.email = email;
    notifyListeners();
  }

  void setCurrentUser(){

  }

  void userLogin(){

  }




}