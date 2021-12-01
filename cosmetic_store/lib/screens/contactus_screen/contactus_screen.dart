import 'dart:async';

import 'package:cosmetic_store/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactusScreen extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  String? username, email, subject, comment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Padding(
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
                    return 'UserName can\'t be Null';
                  }
                },
                decoration: InputDecoration(
                    hintText: "UserName",
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
                ),
              ),
              SizedBox(height: 15),

              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: emailIdController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Email can\'t be Null';
                  }
                  else if(!value.contains('@')){
                    return 'Email should be Valid';
                  }
                },
                decoration: InputDecoration(
                    hintText: "Email Id",
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
                ),
              ),
              SizedBox(height: 15),

              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: subjectController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Subject can\'t be Null';
                  }
                },
                decoration: InputDecoration(
                    hintText: "Subject",
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
                ),
              ),
              SizedBox(height: 15),

              TextFormField(
                cursorColor: AppColors.kTometoColor,
                controller: commentController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Comment can\'t be Null';
                  }
                },
                maxLines: 4,
                decoration: InputDecoration(
                    hintText: "Comment",
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contactUsButton() {
    return GestureDetector(
      onTap: () {
        username = userNameController.text.trim();
        email = emailIdController.text.trim();
        subject = subjectController.text.trim();
        comment = commentController.text.trim();

        if(formKey.currentState!.validate()) {
          print('$username &&& $email &&& $subject &&& $comment');
          userNameController.clear();
          emailIdController.clear();
          subjectController.clear();
          commentController.clear();
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
