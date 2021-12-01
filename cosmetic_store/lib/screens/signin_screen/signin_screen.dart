import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/screens/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    print('SignIn Page On');

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                signInImage(),
                SizedBox(height: 30),

                signInText(),
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

                signUpText(),
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

  Widget signInImage() {
    return Container(
      width: Get.width * 0.50, height: 75,
      child: Image(
        image: AssetImage(AssetsImageUrl.logo),
      ),
    );
  }

  Widget signInText() {
    return Text(
      "Sign In",
      style: TextStyle(
        color: CustomColor.kTometoColor,
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
    );
  }

  Widget emailIdField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: "Email Id",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.kTometoColor),
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
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: "Password",
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.kTometoColor),
              borderRadius: BorderRadius.circular(25),
          ),
        ),
        controller: passwordController,
        validator: (value) {
          if (value!.isEmpty /* || value.length == null*/) {
            return "Password cannot be empty";
          }
        },
      ),
    );
  }

  Widget rememberPass() {
    // bool isChecked = false;

    return Padding(
      padding: const EdgeInsets.only(left: 6,right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Checkbox(
                  activeColor: CustomColor.kTometoColor,
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      print(isChecked);
                    });
                  },
                ),
                Text('Remember Password?'),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {print('Clicked On Forgot Password?');},
            child: Text('Forgot Password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
                // fontSize: 17
              ),),
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
            print('Inside formkey');
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kTometoColor,
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

  Widget signUpText() {
    return Container(
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
              Get.off(()=> SignUpScreen());
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: CustomColor.kTometoColor,
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
            style: TextStyle(color: CustomColor.kTometoColor, fontSize: 17),
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
            AssetsImageUrl.facebook,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {print('Clicked On Twitter');},
          child: Image.asset(
            AssetsImageUrl.google,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {print('Clicked On Google');},
          child: Image.asset(
            AssetsImageUrl.twitter,
            fit: BoxFit.cover,
            width: 50,
            height: 50,
          ),
        ),
      ],
    );
  }
}
