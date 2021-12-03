import 'package:cosmetic_store/controllers/settings_screen_controller/settings_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_screen_widgets.dart';

class SettingsScreen extends StatelessWidget {
  final settingsScreenController = Get.put(SettingsScreenController());

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
            const SizedBox(height: 10),
            AllowNotification(),
            const SizedBox(height: 10),
            AllowSms(),
            const SizedBox(height: 10),
            AllowEmails(),
            const SizedBox(height: 10),
            DarkMode(),
            const SizedBox(height: 10),
            ChangePassword(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

}
