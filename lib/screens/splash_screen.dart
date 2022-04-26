import 'dart:developer';

import 'package:assignment/controllers/global_controller.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 1));
      bool isUser = Provider.of<GlobalController>(context, listen: false).isUser;
      log('auth: $isUser');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => isUser ? HomeScreen() : LoginScreen()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text('Assignment\nApp',
            textAlign: TextAlign.center, style: TextStyle(fontSize: 24, height: 1.5)),
      ),
    );
  }
}
