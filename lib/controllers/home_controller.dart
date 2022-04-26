import 'dart:convert';
import 'dart:developer';

import 'package:assignment/models/api_models/category_api.dart';
import 'package:assignment/models/api_models/login_api.dart';
import 'package:assignment/models/api_models/menu_api.dart';
import 'package:assignment/models/category.dart';
import 'package:assignment/models/menu.dart';
import 'package:assignment/models/user.dart';
import 'package:assignment/services/api_service.dart';
import 'package:assignment/utils/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class HomeController with ChangeNotifier {
  ApiService apiService = ApiService();
  GetStorage getStorage = GetStorage();
  List<Category> categories = [];
  List<Menu> menus = [];
  User? user;
  bool menuLoader = true;
  bool categoryLoader = true;

  void initController(BuildContext context) {
    final loginApi = LoginApi.fromJson(json.decode(getStorage.read(LOGIN_API)));
    user = loginApi.user;
    notifyListeners();
    getAllCategories(user!.firstName!);
    getAllMenus(user!.lastName!);
  }

  void disposeController() {
    user = null;
    menuLoader = true;
    categoryLoader = true;
  }

  Future<void> getAllCategories(String apiUrl) async {
    log('getAllCategories');
    categoryLoader = true;
    notifyListeners();
    http.Response? response = await apiService.getRequest(endPoint: apiUrl, header: AUTH);
    if (response != null) {
      final jsonData = json.decode(response.body);
      if (jsonData['status_code'] == 200) {
        categories.clear();
        final categoryApi = CategoryApi.fromJson(jsonData);
        bool haveData = categoryApi.categories != null && categoryApi.categories!.length > 0 ? true : false;
        if (haveData) categories.addAll(categoryApi.categories!);
      }
      categoryLoader = false;
      notifyListeners();
      print(categories);
    } else {
      categoryLoader = false;
      notifyListeners();
    }
  }

  Future<void> getAllMenus(String apiUrl) async {
    log('getAllMenus');
    menuLoader = true;
    notifyListeners();
    http.Response? response = await apiService.getRequest(endPoint: apiUrl, header: AUTH);
    if (response != null) {
      final jsonData = json.decode(response.body);
      if (jsonData['status_code'] == 200) {
        menus.clear();
        final menuApi = MenuApi.fromJson(jsonData);
        bool haveData = menuApi.menus != null && menuApi.menus!.length > 0 ? true : false;
        if (haveData) menus.addAll(menuApi.menus!);
      }
      menuLoader = false;
      notifyListeners();
      print(menus);
    } else {
      menuLoader = false;
      notifyListeners();
    }
  }
}
