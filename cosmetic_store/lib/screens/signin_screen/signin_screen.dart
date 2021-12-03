import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/signin_screen_controller/signin_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signin_screen_widgets.dart';

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
                        const SizedBox(height: 30),
                        SignInAndSignUpHeader(text: "Sign In"), // Import From Common Widgets
                        const SizedBox(height: 20),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              EmailIdField(emailController: emailController),
                              SizedBox(height: 10),
                              PasswordField(passwordController: passwordController),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        RememberPass(),
                        const SizedBox(height: 10),
                        LoginButton(
                          formKey: formKey,
                          emailController: emailController,
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: 30),
                        SignInAndSignUpText(index: 0), // Import From Common Widgets
                        const SizedBox(height: 20),
                        OrText(), // Import From Common Widgets
                        const SizedBox(height: 25),
                        SocialButtons(), // Import From Common Widgets
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

}
