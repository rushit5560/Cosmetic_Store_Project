import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/contact_us_screen__controller/contact_us_screen__controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'contactus_screen_widgets.dart';

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
                      MapViewModule(),
                      const SizedBox(height: 20),
                      ContactFormModule(
                        formKey: formKey,
                        userNameController: userNameController,
                        emailIdController: emailIdController,
                        commentController: commentController,
                        phoneController: phoneController,
                        subjectController: subjectController,
                      ),
                      const SizedBox(height: 20),
                      ContactUsButton(
                        formKey: formKey,
                        userNameController: userNameController,
                        emailIdController: emailIdController,
                        commentController: commentController,
                        phoneController: phoneController,
                        subjectController: subjectController,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

}
