import 'dart:io';

import 'package:assignment/utils/constraints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String bearerToken = 'null';
  static BuildContext? buildContext;

  static initClass({required BuildContext context, required String token}) {
    bearerToken = token;
    buildContext = context;
  }

  getRequest({required String endPoint, required String header}) async {
    HttpClient client = HttpClient();
    try {
      http.Response response =
          await http.get(Uri.parse(endPoint), headers: getHeader(header: header));
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return response;
      } else if (statusCode == 400 || statusCode == 401) {
        return null; // UNAUTHORIZED
      } else if (statusCode == 500) {
        return null; // SERVER ERROR
      } else {
        return null;
      }
    } catch (error) {
      print('ERROR::::::$error::::::$endPoint');
      return null;
    } finally {
      client.close();
    }
  }

  postRequest({required String endPoint, required String? body, required String header}) async {
    HttpClient client = HttpClient();
    try {
      http.Response response =
          await http.post(Uri.parse(endPoint), body: body, headers: getHeader(header: header));
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return response;
      } else if (statusCode == 400 || statusCode == 401) {
        return null; // UNAUTHORIZED
      } else if (statusCode == 500) {
        return null; // SERVER ERROR
      } else {
        return null;
      }
    } catch (error) {
      print('ERROR::::::$error::::::$endPoint');
      return null;
    } finally {
      client.close();
    }
  }

  deleteRequest({required String endPoint, required String? body}) async {
    HttpClient client = HttpClient();
    try {
      http.Response response =
          await http.delete(Uri.parse(endPoint), body: body, headers: getAuthHeaders());
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return response;
      } else if (statusCode == 400 || statusCode == 401) {
        return null; // UNAUTHORIZED
      } else if (statusCode == 500) {
        return null; // SERVER ERROR
      } else {
        return null;
      }
    } catch (error) {
      print('ERROR::::::$error::::::$endPoint');
      return null;
    } finally {
      client.close();
    }
  }

  putRequest({required String endPoint, required String? body}) async {
    HttpClient client = HttpClient();
    try {
      http.Response response =
          await http.put(Uri.parse(endPoint), body: body, headers: getAuthHeaders());
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return response;
      } else if (statusCode == 400 || statusCode == 401) {
        return null; // UNAUTHORIZED
      } else if (statusCode == 500) {
        return null; // SERVER ERROR
      } else {
        return null;
      }
    } catch (error) {
      print('ERROR::::::$error::::::$endPoint');
      return null;
    } finally {
      client.close();
    }
  }

  putRequestHTTP({required String endPoint, required String? body}) async {
    HttpClient client = HttpClient();
    try {
      http.Response response =
          await http.put(Uri.parse(endPoint), body: body, headers: getHttpHeaders());
      int statusCode = response.statusCode;
      if (statusCode == 200 || statusCode == 201) {
        return response;
      } else if (statusCode == 400 || statusCode == 401) {
        return null; // UNAUTHORIZED
      } else if (statusCode == 500) {
        return null; // SERVER ERROR
      } else {
        return null;
      }
    } catch (error) {
      print('ERROR::::::$error::::::$endPoint');
      return null;
    } finally {
      client.close();
    }
  }

  getHeader({required String header}) {
    if (header == HTTP) {
      return getHttpHeaders();
    } else if (header == AUTH) {
      return getAuthHeaders();
    } else {
      return getHttpHeaders();
    }
  }

  static Map<String, String> getHttpHeaders() {
    Map<String, String> headers = Map();
    headers['Content-Type'] = 'application/json_files';
    return headers;
  }

  static Map<String, String> getAuthHeaders() {
    Map<String, String> headers = Map<String, String>();
    headers['Authorization'] = bearerToken;
    headers['Content-Type'] = 'application/json_files';
    return headers;
  }
}
