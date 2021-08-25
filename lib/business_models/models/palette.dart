import 'package:cloud_firestore/cloud_firestore.dart';

class UserPalette{
  String?  name;
  String?  memo;
  List<String>?  colorCodeList;
  DateTime? createdAt;
  UserPalette({this.name,this.memo,this.colorCodeList,this.createdAt});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'memo': this.memo,
      'colorCodeList': this.colorCodeList,
      'createdAt': this.createdAt,
    };
  }

  UserPalette.fromSnapshot(DocumentSnapshot snapshot)
      : name= snapshot['name'] as String?,
        memo = snapshot['memo'] as String?,
        colorCodeList= snapshot['colorCodeList'],
        createdAt=  snapshot['createdAt'].toDate() as DateTime;

}