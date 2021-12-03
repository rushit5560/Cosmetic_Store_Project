import 'package:cosmetic_store/controllers/notification_screen_controller/notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'notification_screen_widgets.dart';

class NotificationScreen extends StatelessWidget {
  final notificationScreenController = Get.put(NotificationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: NotificationList(),
    );
  }
}
