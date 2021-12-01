import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/favourite_screen/favourite_screen.dart';
import 'package:cosmetic_store/screens/home_screen/home_screen.dart';
import 'package:cosmetic_store/screens/notification_screen/notification_screen.dart';
import 'package:cosmetic_store/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 2;

  final tabs = [
    CartScreen(),
    FavouriteScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen(),
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
            backgroundColor: AppColors.kTometoColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: '',
              tooltip: 'Favourite',
              backgroundColor: AppColors.kTometoColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
              tooltip: 'Home',
              backgroundColor: AppColors.kTometoColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: '',
            tooltip: 'Notification',
            backgroundColor: AppColors.kTometoColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: '',
            tooltip: 'Profile',
            backgroundColor: AppColors.kTometoColor,
          ),

        ],
      ),
    );
  }
}
