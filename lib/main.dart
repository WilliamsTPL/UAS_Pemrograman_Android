import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:uas_pemrograman_android/common/common.dart';
import 'package:uas_pemrograman_android/content/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: whiteColor,
          textTheme: screenWidth < 500 ? smallText : defaultText,
          fontFamily: "Century Gothic"),
      home: HomeScreen(),
    );
  }
}
