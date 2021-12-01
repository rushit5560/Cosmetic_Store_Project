import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/screens/signin_screen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                signUpImage(),
                SizedBox(height: 30),

                signUpText(),
                SizedBox(height: 20),

                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      userNameField(),
                      SizedBox(height: 10),
                      emailIdField(),
                      SizedBox(height: 10),
                      passwordField(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                signUpButton(),
                SizedBox(height: 30),

                signInText(),
                SizedBox(height: 20),

                orText(),
                SizedBox(height: 25),

                socialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget signUpImage() {
    return Container(
      width: Get.width * 0.50, height: 75,
      child: Image(
        image: AssetImage(AppImages.logo),
      ),
    );
  }

  Widget signUpText() {
    return Text(
      "Sign Up",
      style: TextStyle(
        color: AppColors.kTometoColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
    );
  }

  Widget userNameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "UserName",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25)),
        ),
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

  Widget emailIdField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Email Id",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25)),
        ),
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

  Widget passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Password",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orangeAccent),
              borderRadius: BorderRadius.circular(25)),
        ),
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password cannot be empty";
          }
        },
      ),
    );
  }

  Widget signUpButton() {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
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

  Widget signInText() {
    return Container(
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
               Get.off(()=> SignInScreen());
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

  Widget orText() {
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

  Widget socialButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {print('Clicked On Facebook');},
          child: Image.asset(
            'assets/images/facebook.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {print('Clicked On Twitter');},
          child: Image.asset(
            'assets/images/twitter.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {print('Clicked On Google');},
          child: Image.asset(
            'assets/images/google.png',
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
