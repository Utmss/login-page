import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_basic/ui/auth/login.dart';
import 'package:firebase_basic/ui/auth/login_btn.dart';
import 'package:firebase_basic/ui/auth/utility.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void sign() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passwordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Sign Up"),
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
                            return "Empty Email";
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
                            return "Already have account ? ";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
              Roundbutton(
                  title: "Sign Up",
                  loading: loading,
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      sign();
                    }
                    ;
                  }),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text("Already have account ? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Loginscreen()));
                      },
                      child: Text('Login'))
                ],
              )
            ],
          ),
        ));
  }
}
