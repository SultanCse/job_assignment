import 'package:assignment/models/menu.dart';

class MenuApi {
  String? message;
  int? statusCode;
  List<Menu>? menus;

  MenuApi({this.message, this.statusCode, this.menus});

  MenuApi.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      menus = [];
      json['data'].forEach((v) => menus?.add(Menu.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status_code'] = statusCode;
    if (menus != null) map['data'] = menus?.map((v) => v.toJson()).toList();
    return map;
  }
}
