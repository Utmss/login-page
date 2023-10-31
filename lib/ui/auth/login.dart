import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_basic/ui/auth/login_btn.dart';
import 'package:firebase_basic/ui/auth/post_screen.dart';
import 'package:firebase_basic/ui/auth/sign_up.dart';
import 'package:firebase_basic/ui/auth/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text,
            password: passwordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Utils().toastMessage(value.user!.email.toString());

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => postscreen()));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            "Login",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailcontroller,
                          decoration: InputDecoration(hintText: "Email"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: passwordcontroller,
                          obscureText: true,
                          decoration: InputDecoration(hintText: "Password"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Password";
                            }
                            return null;
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Roundbutton(
                    title: 'login',
                    loading: loading,
                    onTap: () {
                      if (_formkey.currentState!.validate()) {
                        login();
                      }
                      ;
                    }),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("Don't have account ? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signup()));
                        },
                        child: Text("Sign Up"))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
