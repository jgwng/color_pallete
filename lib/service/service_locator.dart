import 'package:colorpallete/business_models/view_models/delegate_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt serviceLocator = GetIt.instance;

void setupServiceLocator() {
  serviceLocator.registerFactory<DelegateViewModel>(() => DelegateViewModel());
//  serviceLocator.registerFactory<SignUpViewModel>(() => SignUpViewModel());
//
//  serviceLocator.registerLazySingleton<CRMViewModel>(() => CRMViewModel());
//  serviceLocator.registerLazySingleton<AdminViewModel>(() => AdminViewModel());
//  serviceLocator.registerLazySingleton<PetUHomeViewModel>(() => PetUHomeViewModel());
//  serviceLocator.registerLazySingleton<FBDatabaseService>(() => FBDatabaseServiceImpl());
//  serviceLocator.registerLazySingleton<FBAuthService>(() => FBAuthServiceImpl());
//  serviceLocator.registerLazySingleton<FBStorageService>(() => FBStorageServiceImpl());

}