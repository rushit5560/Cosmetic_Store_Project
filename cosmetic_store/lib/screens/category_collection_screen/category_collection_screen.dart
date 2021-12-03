import 'package:cosmetic_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'category_collection_screen_widgets.dart';

class CategoryCollectionScreen extends StatelessWidget {
  CategoryCollectionScreenController categoryCollectionScreenController = Get.put(CategoryCollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          '${categoryCollectionScreenController.categoryName}',
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
            () => categoryCollectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : CategoryCollectionListModule(),
      ),
    );
  }
}
