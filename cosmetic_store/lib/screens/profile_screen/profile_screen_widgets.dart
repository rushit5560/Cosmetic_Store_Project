import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:cosmetic_store/screens/notification_screen/notification_screen.dart';
import 'package:cosmetic_store/screens/order_screen/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePhotoModule extends StatelessWidget {
  const ProfilePhotoModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.28,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(AppImages.profile),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: -15, right: 20,
            child: Material(
              elevation: 8,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30),
              child: Container(
                width: 40, height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kTometoColor
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.to(()=> EditProfileScreen());
                    },
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                    iconSize: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserDetailsModule extends StatelessWidget {
  const UserDetailsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'UserName',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Jonny Doe',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Email Id',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'jonny123@gmail.com',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Phone Number',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '1234567890',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '7000, WhiteField, Manchester Highway, London, 401203',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),

        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Shipping Address',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '7000, WhiteField, Manchester Highway, London, 401203',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class MyCartModule extends StatelessWidget {
  const MyCartModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(()=> CartScreen());
        },
        child: Text(
          'My Cart',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class MyOrderModule extends StatelessWidget {
  const MyOrderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(()=> OrderScreen());
        },
        child: Text(
          'My Order',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class NotificationModule extends StatelessWidget {
  const NotificationModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(() => NotificationScreen());
        },
        child: Text(
          'Notification',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
