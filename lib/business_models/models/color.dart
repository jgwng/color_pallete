import 'package:cloud_firestore/cloud_firestore.dart';

class UserColor{
  String? name;
  String? memo;
  String? code;

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'memo': this.memo,
      'code': this.code,
    };
  }

  UserColor.fromSnapshot(DocumentSnapshot snapshot)
      : name= snapshot['name'] as String?,
        memo = snapshot['memo'] as String?,
        code= snapshot['code'] as String?;

  UserColor({this.name,this.memo,this.code});


}