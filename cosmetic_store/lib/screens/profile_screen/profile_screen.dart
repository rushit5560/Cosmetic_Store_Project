import 'package:cosmetic_store/screens/profile_screen/profile_screen_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
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
              ProfilePhotoModule(),
              const SizedBox(height: 25),
              UserDetailsModule(),
              const SizedBox(height: 10),
              const Divider(thickness: 2),
              MyCartModule(),
              const Divider(thickness: 2),
              MyOrderModule(),
              const Divider(thickness: 2),
              NotificationModule(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

}
