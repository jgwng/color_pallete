class FirestorePath {

  FirestorePath._();

  static String user(String userUid) => 'user/$userUid';

  static String color(String userUID,int createdAt) => 'user/$userUID/color/$createdAt';

  static String palette(String userUID,int createdAt) => 'user/$userUID/palette/$createdAt';

}