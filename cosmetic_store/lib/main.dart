import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/splash_screen/splash_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Cosmetic Store",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: SplashScreen(),
    );
  }
}

