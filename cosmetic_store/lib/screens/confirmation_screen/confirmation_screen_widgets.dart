import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/screens/index_screen/index_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageAndTextModule extends StatelessWidget {
  const ImageAndTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.height * 0.40,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.confirmation),
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
      ],
    );
  }
}


class BackToHomeButton extends StatelessWidget {
  const BackToHomeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Clicked On Back To Home');
          Get.offAll(()=> IndexScreen());
        },
        child: Container(
          width: Get.width * 0.50,
          decoration: BoxDecoration(
              color: AppColors.kTometoColor,
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
