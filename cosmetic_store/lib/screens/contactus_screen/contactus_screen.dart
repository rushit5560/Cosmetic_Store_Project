import 'dart:async';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/contact_us_screen__controller/contact_us_screen__controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactusScreen extends StatelessWidget {
  ContactUsScreenController contactUsScreenController = Get.put(ContactUsScreenController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String? username, email, phoneNo, subject, comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Obx(
        () => contactUsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      mapView(),
                      SizedBox(height: 20),
                      contactForm(),
                      SizedBox(height: 20),
                      contactUsButton(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget mapView() {
    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.1860, 72.7944),
      zoom: 7,
    );
    Completer<GoogleMapController> _controller = Completer();

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

  Widget contactForm() {
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
                  if(value!.isEmpty){
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
                  if(value!.isEmpty){
                    return 'Email can\'t be Empty';
                  }
                  else if(!value.contains('@')){
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
                  if(value!.isEmpty){
                    return 'Phone No can\'t be Empty';
                  } else if(value.length != 10){
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
                  if(value!.isEmpty){
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
                  if(value!.isEmpty){
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
      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
    );
  }

  Widget contactUsButton() {
    return GestureDetector(
      onTap: () {
        username = userNameController.text.trim();
        email = emailIdController.text.trim().toLowerCase();
        phoneNo = phoneController.text.trim();
        subject = subjectController.text.trim();
        comment = commentController.text.trim();

        if(formKey.currentState!.validate()) {
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          ),
        ),
      ),
    );
  }
}
