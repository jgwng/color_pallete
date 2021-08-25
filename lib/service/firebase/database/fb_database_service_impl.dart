import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorpallete/business_models/models/color.dart';
import 'package:colorpallete/business_models/models/palette.dart';
import 'package:colorpallete/business_models/models/user.dart';
import 'package:colorpallete/business_models/view_models/auth_view_model.dart';
import 'package:colorpallete/const/firestore_path.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service.dart';
import 'package:colorpallete/service/service_locator.dart';

class FBDatabaseServiceImpl extends FBDatabaseService{
  FirebaseFirestore get fireStore => FirebaseFirestore.instance;

  @override
  Future<void> signUpUser(PaletteUser user) async{
   Map<String,dynamic> userInfo = user.toMap();
   await fireStore.doc(FirestorePath.user(user.userUID!)).set(userInfo);
  }

  @override
  Future<PaletteUser> fetchUserData(String uid) async{
    var  userInfo = await fireStore.doc(FirestorePath.user(uid)).get();
    return PaletteUser.fromSnapshot(userInfo);
  }

  @override
  Future<void> saveColor(UserColor userColor) async{
    final userModel = serviceLocator.get<AuthViewModel>();
    String uid = userModel.baseUser.userUID!;
    Timestamp timeStamp = Timestamp.fromDate(userColor.createdAt!);
    Map<String,dynamic> colorInfo = userColor.toMap();
    await fireStore.doc(FirestorePath.color(uid,timeStamp.nanoseconds)).set(colorInfo);
  }

  @override
  Future<void> savePalette(UserPalette userPalette) async{
    final userModel = serviceLocator.get<AuthViewModel>();
    String uid = userModel.baseUser.userUID!;
    Timestamp timeStamp = Timestamp.fromDate(userPalette.createdAt!);
    Map<String,dynamic> paletteInfo = userPalette.toMap();
    await fireStore.doc(FirestorePath.palette(uid,timeStamp.nanoseconds)).set(paletteInfo);
  }

}