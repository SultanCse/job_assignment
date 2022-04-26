import 'dart:convert';

import 'package:assignment/common/toast_messages.dart';
import 'package:assignment/controllers/global_controller.dart';
import 'package:assignment/models/api_models/login_api.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/services/api_service.dart';
import 'package:assignment/services/api_urls.dart';
import 'package:assignment/utils/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginController with ChangeNotifier {
  ApiService apiService = ApiService();
  final phone = TextEditingController();
  final password = TextEditingController();
  bool loader = false;

  void initController(BuildContext context) {}

  void disposeController() {
    loader = false;
  }

  loginOnTap(BuildContext context) async {
    if (phone.text.length < 1) {
      errorToast(message: 'Please enter your phone number');
      return false;
    }
    if (password.text.length < 1) {
      errorToast(message: 'Please enter your password');
      return false;
    }

    FocusScope.of(context).unfocus();
    loader = true;
    notifyListeners();
    Map body = {"phone": phone.text, "password": password.text};
    String encodeBody = json.encode(body);
    http.Response? response = await apiService.postRequest(endPoint: ApiUrl.login, body: encodeBody, header: HTTP);
    if (response != null) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['status_code'] == 200) {
        LoginApi loginApi = LoginApi.fromJson(jsonResponse);
        print(loginApi.toJson());
        GetStorage().write(IS_USER, true);
        GetStorage().write(LOGIN_API, json.encode(loginApi));
        toastMessage(message: 'Welcome ${loginApi.user?.username ?? ''}');
        ApiService.initClass(context: context, token: 'Bearer ' + loginApi.token!.plainTextToken!);
        Provider.of<GlobalController>(context, listen: false).initController(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        errorToast(message: 'Invalid phone number or password');
      }
    }
    loader = false;
    notifyListeners();
  }
}
