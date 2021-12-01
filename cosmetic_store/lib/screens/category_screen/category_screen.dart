import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/collection_screen/collection_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryScreen extends StatelessWidget {

  final categoryList = [
    AssetsImageUrl.category1, AssetsImageUrl.category2,
    AssetsImageUrl.category3, AssetsImageUrl.category4,
    AssetsImageUrl.category5, AssetsImageUrl.category6,
    AssetsImageUrl.category7, AssetsImageUrl.category8,
    AssetsImageUrl.category9, AssetsImageUrl.category10,
    AssetsImageUrl.category11, AssetsImageUrl.category12,
    AssetsImageUrl.category11, AssetsImageUrl.category12,
    AssetsImageUrl.category11, AssetsImageUrl.category12,
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
                  color: CustomColor.kTometoColor,
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
