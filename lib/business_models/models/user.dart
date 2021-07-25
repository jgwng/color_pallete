import 'package:cloud_firestore/cloud_firestore.dart';

class PaletteUser{
  String? email;
  String? nickname;
  String? userUID;
  PaletteUser({this.email,this.nickname,this.userUID});

  Map<String, dynamic> toMap() {
    return {
      'email': this.email,
      'nickname': this.nickname,
      'userUID' : this.userUID
    };
  }

  PaletteUser.fromSnapshot(DocumentSnapshot snapshot)
      : email= snapshot['email'] as String?,
        userUID = snapshot['userUID'] as String?,
        nickname= snapshot['email'] as String?;

}