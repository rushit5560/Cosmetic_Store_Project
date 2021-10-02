import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/pages/cart_page/cart_page.dart';
import 'package:cosmetic_store/pages/collection_page/collection_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CategoryPage extends StatelessWidget {

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
                Get.to(CartPage());
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
                Get.to(CollectionPage());
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
