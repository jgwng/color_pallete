
import 'package:colorpallete/business_models/models/color.dart';
import 'package:colorpallete/business_models/models/palette.dart';
import 'package:colorpallete/business_models/models/user.dart';

abstract class FBDatabaseService {
  Future<void> signUpUser(PaletteUser user);

  Future<PaletteUser> fetchUserData(String uid);

  Future<void> saveColor(UserColor userColor);

  Future<void> savePalette(UserPalette userPalette);
}