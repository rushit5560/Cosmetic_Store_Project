import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/sign_up_screen_controller/sign_up_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup_screen_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreenController signUpScreenController = Get.put(SignUpScreenController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => signUpScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // Import From Common Widgets
                        SignInImage(),
                        const SizedBox(height: 30),
                        // Import From Common Widgets
                        SignInAndSignUpHeader(text: "Sign Up"),
                        const SizedBox(height: 20),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              UserNameField(usernameController: usernameController),
                              SizedBox(height: 10),
                              EmailIdField(emailController: emailController),
                              SizedBox(height: 10),
                              PasswordField(passwordController: passwordController),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        SignUpButton(
                          formKey: formKey,
                          usernameController: usernameController,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: 30),
                        // Import From Common Widgets
                        SignInAndSignUpText(index: 1),
                        const SizedBox(height: 20),
                        // Import From Common Widgets
                        OrText(),
                        const SizedBox(height: 25),
                        // Import From Common Widgets
                        SocialButtons(),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  // Widget userNameField() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 15),
  //     child: TextFormField(
  //       decoration: inputDecoration('UserName'),
  //       controller: usernameController,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return "UserName cannot be empty";
  //         } else if (value.length < 6) {
  //           return "UserName Atleast 6 Character";
  //         }
  //       },
  //     ),
  //   );
  // }

  // Widget emailIdField() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 15),
  //     child: TextFormField(
  //       decoration: inputDecoration('Email Id'),
  //       controller: emailController,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return "Email cannot be empty";
  //         } else if (!value.contains('@')) {
  //           return "Email Not valid";
  //         }
  //       },
  //     ),
  //   );
  // }

  // Widget passwordField() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 15),
  //     child: TextFormField(
  //       obscureText: true,
  //       decoration: inputDecoration('Password'),
  //       controller: passwordController,
  //       validator: (value) {
  //         if (value!.isEmpty) {
  //           return "Password cannot be empty";
  //         }
  //       },
  //     ),
  //   );
  // }

  // Widget signUpButton() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(horizontal: 15),
  //     child: GestureDetector(
  //       onTap: () {
  //         if (formKey.currentState!.validate()) {
  //           signUpScreenController.getRegisterData(
  //             '${usernameController.text.trim()}',
  //             '${emailController.text.trim().toLowerCase()}',
  //             '${passwordController.text.trim()}',
  //           );
  //         }
  //       },
  //       child: Container(
  //         width: Get.width,
  //         decoration: BoxDecoration(
  //             color: AppColors.kTometoColor,
  //             borderRadius: BorderRadius.circular(25)),
  //         child: Center(
  //             child: Padding(
  //           padding: const EdgeInsets.symmetric(vertical: 15),
  //           child: Text(
  //             'Sign Up',
  //             style: TextStyle(
  //                 color: Colors.white,
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 15),
  //           ),
  //         )),
  //       ),
  //     ),
  //   );
  // }
}
