import 'package:cosmetic_store/screens/signin_screen/signin_screen.dart';
import 'package:cosmetic_store/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_images.dart';
import 'app_color.dart';

class SignInImage extends StatelessWidget {
  const SignInImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.50,
      height: 75,
      child: Image(
        image: AssetImage(AppImages.logo),
      ),
    );
  }
}

class SignInAndSignUpHeader extends StatelessWidget {
  String text;
  SignInAndSignUpHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      "$text",
      style: TextStyle(
        color: AppColors.kTometoColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
    );
  }
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    hintText: "$hintText",
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.kTometoColor),
        borderRadius: BorderRadius.circular(25)),
  );
}

class SignInAndSignUpText extends StatelessWidget {
  int index;
  SignInAndSignUpText({required this.index});

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'have Not Account?',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.off(() => SignUpScreen());
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: AppColors.kTometoColor,
                        fontSize: 17,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          )
        : Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already Account?',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Get.off(() => SignInScreen());
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        color: AppColors.kTometoColor,
                        fontSize: 17,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          );
  }
}

class OrText extends StatelessWidget {
  const OrText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.black,
                endIndent: 15,
                indent: 40,
              )),
          Text(
            'OR',
            style: TextStyle(color: AppColors.kTometoColor, fontSize: 17),
          ),
          Expanded(
              child: Divider(
                thickness: 1,
                color: Colors.black,
                indent: 15,
                endIndent: 40,
              )),
        ],
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            print('Clicked On Facebook');
          },
          child: Image.asset(
            AppImages.facebook,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print('Clicked On Twitter');
          },
          child: Image.asset(
            AppImages.google,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            print('Clicked On Google');
          },
          child: Image.asset(
            AppImages.twitter,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: Colors.transparent,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.kTometoColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

