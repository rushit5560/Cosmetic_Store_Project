import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/onboarding_screen_controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding_screen_widgets.dart';

class OnBoardingScreen extends StatelessWidget {

  OnBoardingController onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.kTometoColor,
              AppColors.kMiddleColor,
              AppColors.kDarkBlueColor,
            ]
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageViewBuilder(),
            NextButton(),
          ],
        ),
      ),
    );
  }
}
