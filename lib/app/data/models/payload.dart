import 'package:hive/hive.dart';
import 'package:laser/app/data/models/user.dart';

part 'payload.g.dart'; // This file will be generated by running the Hive generator

@HiveType(typeId: 3)
class Payload extends HiveObject {
  @HiveField(0)
  final String? token;

  @HiveField(1)
  final User? user;

  @HiveField(2)
  final String? msg;

  Payload({
    this.token,
    this.user,
    this.msg,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      token: json['token'],
      user: User.fromJson(json['user']),
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'user': user?.toJson(),
      'msg': msg,
    };
  }

  Payload.fromData(
      {required this.token, required this.user, required this.msg});
  // copyWith remains unchanged.
}
