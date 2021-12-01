import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/collection_screen/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryScreen extends StatelessWidget {

  final categoryList = [
    AppImages.category1, AppImages.category2,
    AppImages.category3, AppImages.category4,
    AppImages.category5, AppImages.category6,
    AppImages.category7, AppImages.category8,
    AppImages.category9, AppImages.category10,
    AppImages.category11, AppImages.category12,
    AppImages.category11, AppImages.category12,
    AppImages.category11, AppImages.category12,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories',
        style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: (){
                Get.to(()=> CartScreen());
              },
              icon: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),

      body: GridView.builder(
        itemCount: categoryList.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context ,index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                print('Clicked On Index Number : $index');
                Get.to(()=> CollectionScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.kTometoColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                          color: Colors.white,
                        shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(categoryList[index]),
                      )
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
