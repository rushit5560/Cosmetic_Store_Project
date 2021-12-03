import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/settings_screen_controller/settings_screen_controller.dart';
import 'package:cosmetic_store/screens/change_password_screen/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllowNotification extends StatelessWidget {
  final settingsScreenController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Allow Notification',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: settingsScreenController.notificationValue.value,
                onChanged: (value) {
                  settingsScreenController.notificationValue.value = value;
                  print(
                      "notificationValue : ${settingsScreenController.notificationValue.value}");
                },
                activeTrackColor: AppColors.kTometoColor,
                activeColor: AppColors.kCollection2,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class AllowSms extends StatelessWidget {
  final settingsScreenController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Allow SMS',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: settingsScreenController.smsValue.value,
                onChanged: (value) {
                  settingsScreenController.smsValue.value = value;
                  print(
                      "smsValue : ${settingsScreenController.smsValue.value}");
                },
                activeTrackColor: AppColors.kTometoColor,
                activeColor: AppColors.kCollection2,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class AllowEmails extends StatelessWidget {
  final settingsScreenController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Allow Emails',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: settingsScreenController.emailsValue.value,
                onChanged: (value) {
                  settingsScreenController.emailsValue.value = value;
                  print(
                      "emailsValue : ${settingsScreenController.emailsValue.value}");
                },
                activeTrackColor: AppColors.kTometoColor,
                activeColor: AppColors.kCollection2,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class DarkMode extends StatelessWidget {
  final settingsScreenController = Get.find<SettingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Switch(
                value: settingsScreenController.darkModeValue.value,
                onChanged: (value) {
                  settingsScreenController.darkModeValue.value = value;
                  print(
                      "darkModeValue : ${settingsScreenController.darkModeValue.value}");
                },
                activeTrackColor: AppColors.kTometoColor,
                activeColor: AppColors.kCollection2,
              )
            ],
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChangePasswordScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Material(
          borderRadius: BorderRadius.circular(35),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            child: Container(
              width: Get.width,
              child: Text(
                'Change Password',
                // textScaleFactor: 1.3,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
