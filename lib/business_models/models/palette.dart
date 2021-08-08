import 'package:cloud_firestore/cloud_firestore.dart';

class UserPalette{
  String?  name;
  String?  memo;
  List<dynamic>?  colorCodeList;

  UserPalette({this.name,this.memo,this.colorCodeList});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'memo': this.memo,
      'colorCodeList': this.colorCodeList,
    };
  }

  UserPalette.fromSnapshot(DocumentSnapshot snapshot)
      : name= snapshot['name'] as String?,
        memo = snapshot['memo'] as String?,
        colorCodeList= snapshot['colorCodeList'] ;

}