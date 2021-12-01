import 'dart:async';
import 'package:cosmetic_store/screens/index_screen/index_screen.dart';
import 'package:cosmetic_store/screens/onboarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  bool? onBoardingValue = false;

  @override
  void onInit() {
    super.onInit();
    Timer(Duration(seconds: 4), getOnBoardingValue);
  }

  getOnBoardingValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');

    if (onBoardingValue == true) {
      Get.offAll(()=> IndexScreen());
    } else {
      Get.offAll(()=> OnBoardingScreen());
    }
    
  }
}
