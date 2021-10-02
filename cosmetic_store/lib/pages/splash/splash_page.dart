import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/pages/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {

  SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsImageUrl.splash),
            fit: BoxFit.cover,
          )
        ),
      ),
    );
  }
}
