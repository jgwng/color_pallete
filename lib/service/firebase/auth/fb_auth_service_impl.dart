import 'package:colorpallete/service/firebase/auth/fb_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FBAuthServiceImpl extends FBAuthService{
  FirebaseAuth get auth => FirebaseAuth.instance;

  @override
  Future<String?> signIn(String email, String password) async{
    String? result;
    try{
      UserCredential? user =  await auth.signInWithEmailAndPassword(email: email, password: password);
      result = (user.user != null) ? user.user!.uid : null;
    }catch(e){
      result = null;
    }

    return result;
  }

  @override
  Future<void> signOut() async{
    await auth.signOut();
  }

  @override
  Future<String?> signUp(String email, String password) async{
    UserCredential user = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return user.user!.uid;
  }

}