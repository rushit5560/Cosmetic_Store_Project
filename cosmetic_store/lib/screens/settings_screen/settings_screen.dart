import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/screens/change_password_screen/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationValue = false;
  bool _smsValue = false;
  bool _emailsValue = false;
  bool _darkModeValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
            allowNotification(),
            SizedBox(height: 10),
            allowSms(),
            SizedBox(height: 10),
            allowEmails(),
            SizedBox(height: 10),
            darkMode(),
            SizedBox(height: 10),
            changePassword(),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }

  Widget allowNotification() {
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
                value: _notificationValue,
                onChanged: (value) {
                  setState(() {
                    _notificationValue = value;
                    print(_notificationValue);
                  });
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

  Widget allowSms() {
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
                value: _smsValue,
                onChanged: (value) {
                  setState(() {
                    _smsValue = value;
                    print(_smsValue);
                  });
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

  Widget allowEmails() {
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
                value: _emailsValue,
                onChanged: (value) {
                  setState(() {
                    _emailsValue = value;
                    print(_emailsValue);
                  });
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

  Widget darkMode() {
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
                value: _darkModeValue,
                onChanged: (value) {
                  setState(() {
                    _darkModeValue = value;
                    print(_darkModeValue);
                  });
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

  Widget changePassword() {
    return GestureDetector(
      onTap: () {
        Get.to(()=> ChangePasswordScreen());
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
