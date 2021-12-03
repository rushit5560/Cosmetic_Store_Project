import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/onboarding_screen_controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewBuilder extends StatelessWidget {
   final onBoardingController = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: onBoardingController.pageController,
      onPageChanged: onBoardingController.selectedPageIndex,
      itemCount: onBoardingController.onBoardingPages.length,
      itemBuilder: (context, index){
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                onBoardingController.onBoardingPages[index].title,
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Image.asset(
                onBoardingController.onBoardingPages[index].imageAsset,
                height: Get.height * 0.35,
              ),
              SizedBox(height: 5),
              Text(
                onBoardingController.onBoardingPages[index].description,
                textAlign: TextAlign.center,
                textScaleFactor: 1.1,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class NextButton extends StatelessWidget {
  final onBoardingController = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: (){
              print('Clicked On Next Button');
              onBoardingController.forwardAction();
            },
            child: Container(
              // height: 40,
              decoration: BoxDecoration(
                  color: AppColors.kTometoColor,
                  borderRadius: BorderRadius.circular(20)
              ),
              width: Get.width * 0.40,
              child: Obx(()=> Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    onBoardingController.isLastPage ? 'Get Start' : 'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              )),
            ),
          ),
          SizedBox(height: 5),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onBoardingController.onBoardingPages.length,
                    (index) => Obx(() => Container(
                  margin: EdgeInsets.all(4),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: onBoardingController.selectedPageIndex.value == index ? AppColors.kTometoColor : Colors.white,
                      shape: BoxShape.circle
                  ),
                ),
                ),),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
