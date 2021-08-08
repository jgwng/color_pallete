class FirestorePath {

  FirestorePath._();

  static String user(String userUid) => 'user/$userUid';

  static String color(String userUID) => 'user/$userUID/color';

  static String palette(String userUID) => 'user/$userUID/palette';

}