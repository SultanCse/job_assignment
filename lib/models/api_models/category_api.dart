import 'package:assignment/models/category.dart';

class CategoryApi {
  String? message;
  int? statusCode;
  List<Category>? categories;

  CategoryApi({this.message, this.statusCode, this.categories});

  CategoryApi.fromJson(dynamic json) {
    message = json['message'];
    statusCode = json['status_code'];
    if (json['data'] != null) {
      categories = [];
      json['data'].forEach((v) => categories?.add(Category.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status_code'] = statusCode;
    if (categories != null) map['data'] = categories?.map((v) => v.toJson()).toList();
    return map;
  }
}
