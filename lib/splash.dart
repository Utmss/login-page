import 'package:firebase_basic/firebase_service/splash_services.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Splashservices Splashscreen = Splashservices();
  @override
  void initState() {
    super.initState();
    Splashscreen.isLogin(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "ok",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
