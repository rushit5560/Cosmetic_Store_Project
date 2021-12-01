import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {

  SignInScreenController signInScreenController = Get.put(SignInScreenController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('SignIn Page On');

    return Scaffold(
      body: Obx(
        () => signInScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInImage(), // Import From Common Widgets
                        SizedBox(height: 30),
                        SignInText(), // Import From Common Widgets
                        SizedBox(height: 20),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              emailIdField(),
                              SizedBox(height: 10),
                              passwordField(),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        rememberPass(),
                        SizedBox(height: 10),
                        loginButton(),
                        SizedBox(height: 30),
                        SignUpText(), // Import From Common Widgets
                        SizedBox(height: 20),
                        OrText(), // Import From Common Widgets
                        SizedBox(height: 25),
                        SocialButtons(), // Import From Common Widgets
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Widget emailIdField() {
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

  Widget passwordField() {
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

  Widget rememberPass() {
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

  Widget loginButton() {
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
