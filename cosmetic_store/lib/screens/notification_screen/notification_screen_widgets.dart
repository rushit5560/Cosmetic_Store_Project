import 'package:cosmetic_store/controllers/notification_screen_controller/notification_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationList extends StatelessWidget {
  final notificationScreenController = Get.find<NotificationScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notificationScreenController.notificationItems.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 60, width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(notificationScreenController.notificationItems[index].img),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notificationScreenController.notificationItems[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      notificationScreenController.notificationItems[index].description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
