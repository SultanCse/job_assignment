import 'dart:convert';

import 'package:assignment/models/api_models/login_api.dart';
import 'package:assignment/services/api_service.dart';
import 'package:assignment/utils/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

class GlobalController with ChangeNotifier {
  GetStorage getStorage = GetStorage();
  LoginApi? loginApi;
  bool isUser = false;

  void initController(BuildContext context) async {
    await Future.delayed(Duration(milliseconds: 100));
    isUser = getStorage.read(IS_USER) ?? false;
    if (isUser) {
      loginApi = LoginApi.fromJson(json.decode(getStorage.read(LOGIN_API)));
      ApiService.initClass(context: context, token: 'Bearer ${loginApi!.token!.plainTextToken}');
    }
    notifyListeners();
  }
}
