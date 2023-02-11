import 'package:convox/bindings.dart';
import 'package:convox/controllers/authController.dart';
import 'package:convox/screens/onboard/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   AuthController authController=Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialBinding: AppBindings(),
    );
  }
}
