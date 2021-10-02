import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/pages/index_page/index_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmationPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: Get.height * 0.40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AssetsImageUrl.confirmation),
                )
              ),
            ),
            SizedBox(height: 10),
            Text(
                'All Right',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Your Order has been Confirm',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 25),
            backToHomeButton(),
          ],
        ),
      ),
    );
  }

  Widget backToHomeButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Clicked On Back To Home');
          Get.offAll(IndexPage());
        },
        child: Container(
          width: Get.width * 0.50,
          decoration: BoxDecoration(
              color: CustomColor.kTometoColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Text(
                'Back To Home',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
