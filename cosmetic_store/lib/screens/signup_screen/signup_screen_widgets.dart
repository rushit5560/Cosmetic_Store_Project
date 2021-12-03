import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNameField extends StatelessWidget {
  TextEditingController usernameController;

  UserNameField({required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        decoration: inputDecoration('UserName'),
        controller: usernameController,
        validator: (value) {
          if (value!.isEmpty) {
            return "UserName cannot be empty";
          } else if (value.length < 6) {
            return "UserName Atleast 6 Character";
          }
        },
      ),
    );
  }
}

class EmailIdField extends StatelessWidget {
  TextEditingController emailController;

  EmailIdField({required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        decoration: inputDecoration('Email Id'),
        controller: emailController,
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
        obscureText: true,
        decoration: inputDecoration('Password'),
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password cannot be empty";
          }
        },
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  SignUpScreenController signUpScreenController = Get.find();
  GlobalKey<FormState> formKey;
  TextEditingController usernameController;
  TextEditingController emailController;
  TextEditingController passwordController;

  SignUpButton({
    required this.formKey,
    required this.usernameController,
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
            signUpScreenController.getRegisterData(
              '${usernameController.text.trim()}',
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
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )),
        ),
      ),
    );
  }
}
