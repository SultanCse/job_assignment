import 'package:assignment/models/token.dart';
import 'package:assignment/models/user.dart';

class LoginApi {
  int? statusCode;
  User? user;
  Token? token;

  LoginApi({this.statusCode, this.user, this.token});

  LoginApi.fromJson(dynamic json) {
    statusCode = json['status_code'];
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'] != null ? Token.fromJson(json['token']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = statusCode;
    if (user != null) map['data'] = user?.toJson();
    if (token != null) map['token'] = token?.toJson();
    return map;
  }
}
