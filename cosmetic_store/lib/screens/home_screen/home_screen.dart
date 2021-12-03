import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/common/custom_drawer.dart';
import 'package:cosmetic_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            icon: Icon(Icons.shopping_cart_rounded),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          BannerModule(),
                          Positioned(
                            bottom: 5,
                            child: BannerIndicator(),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      CategoryListModule(),
                      SizedBox(height: 15),
                      NewArrivalListModule(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

}
