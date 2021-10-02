import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/common/custom_drawer.dart';
import 'package:cosmetic_store/pages/cart_page/cart_page.dart';
import 'package:cosmetic_store/pages/favourite_page/favourite_page.dart';
import 'package:cosmetic_store/pages/home_page/home_page.dart';
import 'package:cosmetic_store/pages/notification_page/notification_page.dart';
import 'package:cosmetic_store/pages/profile_page/profile_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 2;

  final tabs = [
    CartPage(),
    FavouritePage(),
    HomePage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),

      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        iconSize: 20,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: '',
            tooltip: 'Cart',
            backgroundColor: CustomColor.kTometoColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: '',
              tooltip: 'Favourite',
              backgroundColor: CustomColor.kTometoColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
              tooltip: 'Home',
              backgroundColor: CustomColor.kTometoColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: '',
            tooltip: 'Notification',
            backgroundColor: CustomColor.kTometoColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: '',
            tooltip: 'Profile',
            backgroundColor: CustomColor.kTometoColor,
          ),

        ],
      ),
    );
  }
}
