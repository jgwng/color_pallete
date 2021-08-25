import 'package:cloud_firestore/cloud_firestore.dart';

class UserColor{
  String? name;
  String? memo;
  String? colorCode;
  DateTime? createdAt;

  @override
  String toString() {
    return 'UserColor{name: $name, memo: $memo, code: $colorCode, createdAt: $createdAt}';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'memo': this.memo,
      'code': this.colorCode,
      'createdAt' : this.createdAt
    };
  }

  UserColor.fromSnapshot(DocumentSnapshot snapshot)
      : name= snapshot['name'] as String?,
        memo = snapshot['memo'] as String?,
        colorCode= snapshot['code'] as String?,
        createdAt=  snapshot['createdAt'].toDate() as DateTime;

  UserColor({this.name,this.memo,this.colorCode,this.createdAt});


}