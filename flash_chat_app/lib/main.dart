import 'package:flash_chat_app/Screens/chat_screen.dart';
import 'package:flash_chat_app/Screens/login_screen.dart';
import 'package:flash_chat_app/Screens/registration_screen.dart';
import 'package:flash_chat_app/Screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
