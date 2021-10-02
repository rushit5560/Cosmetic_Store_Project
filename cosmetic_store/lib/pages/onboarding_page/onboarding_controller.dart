import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/pages/index_page/index_page.dart';
import 'package:cosmetic_store/pages/onboarding_page/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {

  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;

  forwardAction() {
    if(isLastPage){
      setOnBoardingValue();
      Get.off(IndexPage());
    } else {
      // pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }

  List<OnBoardingInfo> onBoardingPages = [
    OnBoardingInfo(
      title: 'Cosmetics',
      imageAsset: AssetsImageUrl.service1,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      title: 'Natural',
      imageAsset: AssetsImageUrl.service2,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      title: 'MakeUp',
      imageAsset: AssetsImageUrl.service3,
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
  ];

  setOnBoardingValue() async {
    print('Call Set Value Method');
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    print('Set Value : ${prefs.getBool("onboarding")}');
  }

}