import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_app/Screens/chat_screen.dart';
import 'package:flash_chat_app/components/rounded_button.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String id = "Login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";
  UserCredential? loggedInUser;
  bool _showSpinner = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    try {
      loggedInUser = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (loggedInUser!.user != null && mounted) {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    } catch (e) {
      log(e.toString());
    }
    setState(() {
      _showSpinner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: 200,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration:
                        getCustomInputDecoration(hint: "Enter your Email"),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    obscureText: true,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration:
                        getCustomInputDecoration(hint: "Enter your Password"),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RoundedButton(
                      text: "Log In",
                      color: Colors.lightBlueAccent,
                      onPressed: () {
                        setState(() {
                          _showSpinner = true;
                        });
                        login();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
