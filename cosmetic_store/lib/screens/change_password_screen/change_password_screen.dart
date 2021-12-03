import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/change_password_screen_controller/change_password_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'change_password_screen_widgets.dart';

class ChangePasswordScreen extends StatelessWidget {
  // const ChangePasswordScreen({Key? key}) : super(key: key);
  ChangePasswordScreenController changePasswordScreenController =
  Get.put(ChangePasswordScreenController());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController oldPasswordFieldController = TextEditingController();
  TextEditingController newPasswordFieldController = TextEditingController();
    TextEditingController cNewPasswordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
      ),
      body: Obx(
        () => changePasswordScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ChangePasswordFieldsModule(
                      formKey: formKey,
                      oldPasswordFieldController: oldPasswordFieldController,
                      newPasswordFieldController: newPasswordFieldController,
                      cNewPasswordFieldController: cNewPasswordFieldController,
                    ),
                  ],
                ),
              ),
      ),
    );
  }


}
