import 'package:assignment/models/access_token.dart';

class Token {
  AccessToken? accessToken;
  String? plainTextToken;

  Token({this.accessToken, this.plainTextToken});

  Token.fromJson(dynamic json) {
    accessToken = json['accessToken'] != null ? AccessToken.fromJson(json['accessToken']) : null;
    plainTextToken = json['plainTextToken'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (accessToken != null) map['accessToken'] = accessToken?.toJson();
    map['plainTextToken'] = plainTextToken;
    return map;
  }
}
