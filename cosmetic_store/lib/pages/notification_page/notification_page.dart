import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/pages/notification_page/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  List<NotificationInfo> notificationItems = [
    NotificationInfo(
      img: AssetsImageUrl.noti2,
      title: 'Special Offers For You',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti1,
      title: 'Your Order will be received',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti2,
      title: 'Special Offers For You',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti1,
      title: 'Your Order will be received',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti2,
      title: 'Special Offers For You',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti1,
      title: 'Your Order will be received',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti2,
      title: 'Special Offers For You',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti1,
      title: 'Your Order will be received',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti2,
      title: 'Special Offers For You',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
    NotificationInfo(
      img: AssetsImageUrl.noti1,
      title: 'Your Order will be received',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse posuere ac urna sit amet pulvinar.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: ListView.builder(
        itemCount: notificationItems.length,
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
                      image: AssetImage(notificationItems[index].img),
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
                        notificationItems[index].title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        notificationItems[index].description,
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
      ),
    );
  }
}
