import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastMessage({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: 16,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.white,
  );
}

successToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: 16,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}

errorToast({required String message}) {
  Fluttertoast.showToast(
    msg: message,
    fontSize: 16,
    backgroundColor: Colors.red.withOpacity(0.6),
    textColor: Colors.white,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
