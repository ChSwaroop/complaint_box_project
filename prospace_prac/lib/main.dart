import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:prospace_prac/Complaint.dart';
import 'package:prospace_prac/admins/api_calls.dart';
import 'package:prospace_prac/login.dart';
// import 'package:prospace_prac/FirstScreen.dart';
// import 'package:prospace_prac/forth.dart';
// import 'package:prospace_prac/thirdScreen.dart';

void main(){  
  
  HttpOverrides.global = MyHttp();
  
  // runApp(
  //   DevicePreview(builder: ((context) => MyApp())
  //  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {

    int h = MediaQuery.of(context).size.height.toInt();
    int w = MediaQuery.of(context).size.width.toInt();

    return MaterialApp(
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: LoginScreen());
  }
}