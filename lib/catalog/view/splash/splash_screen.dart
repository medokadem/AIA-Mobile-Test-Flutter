import 'dart:async';
import 'package:aia_mobile_test_flutter/app/app_routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "SplashScreen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, AppRoutes.chatScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F0F0F), // or your theme color
      body: Center(
        child: Image.asset(
          'assets/images/splash_logo.png',
          width: 300, // adjust as needed
        ),
      ),
    );
  }
}