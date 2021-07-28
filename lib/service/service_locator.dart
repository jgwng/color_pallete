import 'package:colorpallete/business_models/view_models/auth_view_model.dart';
import 'package:colorpallete/business_models/view_models/palette_view_model.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:colorpallete/service/firebase/auth/fb_auth_service.dart';
import 'package:colorpallete/service/firebase/auth/fb_auth_service_impl.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {

  serviceLocator.registerLazySingleton<PaletteViewModel>(() => PaletteViewModel());
  serviceLocator.registerLazySingleton<AuthViewModel>(() => AuthViewModel());


  serviceLocator.registerLazySingleton<FBDatabaseService>(() => FBDatabaseServiceImpl());
  serviceLocator.registerLazySingleton<FBAuthService>(() => FBAuthServiceImpl());

}