import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_basic/ui/auth/login.dart';
import 'package:firebase_basic/ui/auth/post_screen.dart';
import 'package:flutter/material.dart';

class Splashservices {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => postscreen())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Loginscreen())));
    }
  }
}
