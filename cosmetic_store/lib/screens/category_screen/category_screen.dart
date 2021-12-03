import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_screen_widgets.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreenController categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            icon: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),

      body: Obx(
        () => categoryScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : CategoryListModule(),
      ),
    );
  }
}
