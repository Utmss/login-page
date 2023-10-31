import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_basic/ui/auth/login.dart';
import 'package:firebase_basic/ui/auth/utility.dart';
import 'package:flutter/material.dart';

class postscreen extends StatefulWidget {
  const postscreen({super.key});

  @override
  State<postscreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<postscreen> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "PostScreen",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            SizedBox(width: 20),
            IconButton(
                onPressed: () {
                  _auth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginscreen()));
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                },
                icon: Icon(Icons.logout))
          ]),
    );
  }
}
