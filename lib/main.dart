import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmedia/screens/homescreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Social Media App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}