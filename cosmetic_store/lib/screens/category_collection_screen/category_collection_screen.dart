import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/category_collection_screen_controller/category_collection_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            : GridView.builder(
          itemCount: categoryCollectionScreenController.categoryCollectionLists.length,
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final imgUrl = ApiUrl.ApiMainPath +
                '${categoryCollectionScreenController.categoryCollectionLists[index].showimg}';
            return Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                        () => ProductDetailScreen(),
                    arguments: categoryCollectionScreenController.categoryCollectionLists[index].id,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.kCollection1,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Image(
                      image: NetworkImage("$imgUrl"),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
