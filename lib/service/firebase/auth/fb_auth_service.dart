abstract class FBAuthService{
  Future<String?> signIn(String email, String password);

  Future<String?> signUp(String email,String password);

  Future<void> signOut();
}