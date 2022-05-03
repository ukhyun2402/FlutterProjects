import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/my.jpg'),
              ),
              const Text(
                "WookHyun Ha",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Lobster',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "MOBILE DEVELOPER",
                style: TextStyle(
                    color: Colors.teal.shade100,
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 5,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
                width: 150.0,
                child: Divider(
                  height: 5,
                  thickness: 1.0,
                  color: Colors.white,
                ),
              )
              // Container(
              //     margin: EdgeInsets.only(top: 15),
              //     color: Colors.white,
              //     width: 100,
              //     height: 0.7),
              ,
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    "010-2402-1051",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 25,
                ),
                child: ListTile(
                  title: Text(
                    "hyun4911@gmail.com",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'SourceSansPro',
                    ),
                  ),
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
