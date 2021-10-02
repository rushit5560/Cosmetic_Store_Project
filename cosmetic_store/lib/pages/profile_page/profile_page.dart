import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/pages/cart_page/cart_page.dart';
import 'package:cosmetic_store/pages/edit_profile_page/edit_profile_page.dart';
import 'package:cosmetic_store/pages/notification_page/notification_page.dart';
import 'package:cosmetic_store/pages/order_page/order_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profilePhoto(),
              SizedBox(height: 25),
              userDetails(),
              SizedBox(height: 10),

              Divider(thickness: 2),
              myCart(),
              Divider(thickness: 2),
              myOrder(),
              Divider(thickness: 2),
              notification(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget profilePhoto() {
    return Container(
      width: Get.width,
      height: Get.height * 0.28,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(AssetsImageUrl.profile),
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
                  color: CustomColor.kTometoColor
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Get.to(EditProfilePage());
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

  Widget userDetails() {
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

  Widget myCart() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(CartPage());
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

  Widget myOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(OrderPage());
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

  Widget notification() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onTap: () {
          Get.to(NotificationPage());
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
