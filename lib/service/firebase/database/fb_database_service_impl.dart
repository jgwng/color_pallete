import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorpallete/business_models/models/user.dart';
import 'package:colorpallete/const/firestore_path.dart';
import 'package:colorpallete/service/firebase/database/fb_database_service.dart';

class FBDatabaseServiceImpl extends FBDatabaseService{
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @override
  Future<void> signUpUser(PaletteUser user) async{
   Map<String,dynamic> userInfo = user.toMap();
   await firestore.doc(FirestorePath.user(user.userUID!)).set(userInfo);
  }

  @override
  Future<PaletteUser> fetchUserData(String uid) async{
    var  userInfo = await firestore.doc(FirestorePath.user(uid)).get();
    return PaletteUser.fromSnapshot(userInfo);
  }

}