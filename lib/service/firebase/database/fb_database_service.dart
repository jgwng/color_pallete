
import 'package:colorpallete/business_models/models/user.dart';

abstract class FBDatabaseService {
  Future<void> signUpUser(PaletteUser user);

  Future<PaletteUser> fetchUserData(String uid);
}