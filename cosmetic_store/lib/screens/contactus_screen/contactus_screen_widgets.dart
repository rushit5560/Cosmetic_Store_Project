import 'dart:async';

import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/contact_us_screen__controller/contact_us_screen__controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModule extends StatelessWidget {
  final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.1860, 72.7944),
    zoom: 7,
  );
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: Get.height * 0.25,
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
          ),
        ),
      ),
    );
  }
}

class ContactFormModule extends StatelessWidget {
  GlobalKey<FormState> formKey;
  TextEditingController userNameController;
  TextEditingController emailIdController;
  TextEditingController phoneController;
  TextEditingController subjectController;
  TextEditingController commentController;

  ContactFormModule({
    required this.formKey,
    required this.userNameController,
    required this.emailIdController,
    required this.phoneController,
    required this.subjectController,
    required this.commentController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: userNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'UserName can\'t be Empty';
                  }
                },
                decoration: inputDecoration('UserName', 30),
              ),
              SizedBox(height: 15),
              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: emailIdController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email can\'t be Empty';
                  } else if (!value.contains('@')) {
                    return 'Email should be Valid';
                  }
                },
                decoration: inputDecoration('Email Id', 30),
              ),
              SizedBox(height: 15),
              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: phoneController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone No can\'t be Empty';
                  } else if (value.length != 10) {
                    return 'Enter Valid Phone Number';
                  }
                },
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: inputDecoration('Phone No', 30),
              ),
              SizedBox(height: 15),
              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: subjectController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Subject can\'t be Empty';
                  }
                },
                decoration: inputDecoration('Subject', 30),
              ),
              SizedBox(height: 15),
              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: commentController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Comment can\'t be Empty';
                  }
                },
                maxLines: 3,
                decoration: inputDecoration('Comment', 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration inputDecoration(String hintText, double radius) {
    return InputDecoration(
      hintText: "$hintText",
      counterText: '',
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      errorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
      focusedErrorBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
    );
  }
}

class ContactUsButton extends StatelessWidget {
  final contactUsScreenController = Get.find<ContactUsScreenController>();
  String? username, email, phoneNo, subject, comment;
  GlobalKey<FormState> formKey;
  TextEditingController userNameController;
  TextEditingController emailIdController;
  TextEditingController phoneController;
  TextEditingController subjectController;
  TextEditingController commentController;

  ContactUsButton({
    required this.formKey,
    required this.userNameController,
    required this.emailIdController,
    required this.phoneController,
    required this.subjectController,
    required this.commentController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        username = userNameController.text.trim();
        email = emailIdController.text.trim().toLowerCase();
        phoneNo = phoneController.text.trim();
        subject = subjectController.text.trim();
        comment = commentController.text.trim();

        if (formKey.currentState!.validate()) {
          contactUsScreenController.getContactUsData(
            "$username",
            "$email",
            "$phoneNo",
            "$subject",
            "$comment",
          );
        }
      },
      child: Container(
        width: Get.width,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.kTometoColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Contact Us',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
