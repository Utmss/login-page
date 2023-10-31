import 'package:firebase_basic/splash.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBlBXk1XcWyh9ck4D-8u9aVf1-GwRmQ598",
          appId: "1:441393812867:android:211e23e721a054160712b6",
          messagingSenderId: "441393812867",
          projectId: "dummy-79680"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Splashscreen());
  }
}
