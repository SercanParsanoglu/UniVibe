// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';
import '../cache/hive/hive_type_ids.dart';
part 'user_model.g.dart';

@HiveType(typeId: HiveConstants.userHiveId)
class UserModel {
  @HiveField(0)
  String? mail;
  @HiveField(1)
  String? password;
  @HiveField(2)
  String? userName;
  @HiveField(3)
  int? userId;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? lastName;
  @HiveField(6)
  String? uniName;
  @HiveField(7)
  String? uniDepertmant;
  @HiveField(8)
  String? phone;

  UserModel(
      {this.mail,
      this.password,
      this.userName,
      this.userId,
      this.name,
      this.lastName,
      this.uniName,
      this.uniDepertmant,
      this.phone});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'mail': mail,
      'password': password,
      'userName': userName,
      'userId': userId,
      'name': name,
      'lastName': lastName,
      'uniName': uniName,
      'uniDepertmant': uniDepertmant,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      mail: map['mail'] != null ? map['mail'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      uniName: map['uniName'] != null ? map['uniName'] as String : null,
      uniDepertmant:
          map['uniDepertmant'] != null ? map['uniDepertmant'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
