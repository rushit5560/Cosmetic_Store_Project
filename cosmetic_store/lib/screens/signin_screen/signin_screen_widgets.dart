import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailIdField extends StatelessWidget {
  TextEditingController emailController;
  EmailIdField({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: emailController,
        decoration: inputDecoration('Email Id'),
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return "Email cannot be empty";
          } else if (!value.contains('@')) {
            return "Email Not valid";
          }
        },
      ),
    );
  }
}

class PasswordField extends StatelessWidget {
  TextEditingController passwordController;
  PasswordField({required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: passwordController,
        decoration: inputDecoration('Password'),
        obscureText: true,
        cursorColor: Colors.black,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password cannot be empty";
          } else if(value.length <= 5) {
            return "Password more then 5 Character";
          }
        },
      ),
    );
  }
}

class RememberPass extends StatelessWidget {
  // const RememberPass({Key? key}) : super(key: key);
  SignInScreenController signInScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(
                ()=> Container(
              child: Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.kTometoColor,
                    checkColor: Colors.white,
                    value: signInScreenController.isChecked.value,
                    onChanged: (bool? value) {
                      signInScreenController.isChecked.value = value!;
                      print("isChecked : ${signInScreenController.isChecked.value}");
                    },
                  ),
                  Text('Remember Password?'),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Clicked On Forgot Password?');
            },
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                // fontSize: 17
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  SignInScreenController signInScreenController = Get.find();
  GlobalKey<FormState> formKey;
  TextEditingController emailController;
  TextEditingController passwordController;


  LoginButton({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            signInScreenController.getSignInData(
              '${emailController.text.trim().toLowerCase()}',
              '${passwordController.text.trim()}',
            );
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColors.kTometoColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Login',
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
