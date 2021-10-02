import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/pages/index_page/index_page.dart';
import 'package:cosmetic_store/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? userName, email, phoneNo, address, shippingAddress, password;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  userNameField(),
                  SizedBox(height: 20),
                  emailIdField(),
                  SizedBox(height: 20),
                  phoneNoField(),
                  SizedBox(height: 20),
                  addressField(),
                  SizedBox(height: 20),
                  shippingAddressField(),
                  SizedBox(height: 20),
                  passwordField(),
                  SizedBox(height: 20),
                  updateButton(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget userNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
              'UserName',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: userNameController,
          validator: (value) {
            if(value!.isEmpty){
              return 'UserName can\'t be Null';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ],
    );
  }

  Widget emailIdField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Email Id',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: emailIdController,
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if(value!.isEmpty){
              return 'Email Id can\'t be Null';
            }
            else if(!value.contains('@')){
              return 'Email Id Should be Valid';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ],
    );
  }

  Widget phoneNoField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Phone No.',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: phoneNoController,
          keyboardType: TextInputType.number,
          maxLength: 10,
          validator: (value) {
            if(value!.isEmpty){
              return 'Email Id can\'t be Null';
            }
            else if(value.length != 10){
              return 'Phone No. Should be Valid';
            }
          },
          decoration: InputDecoration(
            counterText: '',
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ],
    );
  }

  Widget addressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Address',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: addressController,
          validator: (value) {
            if(value!.isEmpty){
              return 'Address can\'t be Null';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ],
    );
  }

  Widget shippingAddressField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Shipping Address',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: shippingAddressController,
          validator: (value) {
            if(value!.isEmpty){
              return 'Shipping Address can\'t be Null';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ],
    );
  }

  Widget passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Password',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: passwordController,
          obscureText: true,
          validator: (value) {
            if(value!.isEmpty){
              return 'Password can\'t be Null';
            }
          },
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            ),
          ),
        ),
      ],
    );
  }

  Widget updateButton() {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
          userName = userNameController.text.trim();
          email = emailIdController.text.trim();
          phoneNo = phoneNoController.text.trim();
          address = addressController.text.trim();
          shippingAddress = shippingAddressController.text.trim();
          password = passwordController.text.trim();
          print('$userName \n$email \n$phoneNo \n$address \n$shippingAddress \n$password');
          clearTextFields();
          Get.offAll(IndexPage());
        }
      },
      child: Container(
        width: Get.width,
        height: 40,
        decoration: BoxDecoration(
          color: CustomColor.kTometoColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
              'Update Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  clearTextFields() {
    userNameController.clear();
    emailIdController.clear();
    phoneNoController.clear();
    addressController.clear();
    shippingAddressController.clear();
    passwordController.clear();
  }
}
