import 'package:assignment/controllers/global_controller.dart';
import 'package:assignment/controllers/home_controller.dart';
import 'package:assignment/controllers/login_controller.dart';
import 'package:assignment/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GlobalController()),
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*dynamic getData = Services();
    getData.loginRequest(id: '01600223852', password: '123456');*/
    Provider.of<GlobalController>(context, listen: false).initController(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      theme: ThemeData.dark().copyWith(backgroundColor: mobileBackgroundColor),
      // home: const LoginScreen(),
      home: SplashScreen(),
      // home: DataScreen(),
    );
  }
}
