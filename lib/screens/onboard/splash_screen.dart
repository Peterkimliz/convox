import 'dart:async';

import 'package:convox/screens/auth/phone_number.dart';
import 'package:convox/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 500), () {
      Timer(Duration(seconds: 3), () => Get.off(() => PhoneNumber()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles().splashScreenColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: 200,
            width: 300,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}
