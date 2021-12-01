import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/models/collection_screen_model/collection_model.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CollectionScreen extends StatelessWidget {
  List<CollectionInfo> collectionList = [
    CollectionInfo(
        backColor: AppColors.kCollection1,
        collectionImg: AppImages.collection1,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection2,
      collectionImg: AppImages.collection2,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection3,
      collectionImg: AppImages.collection3,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection4,
      collectionImg: AppImages.collection4,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection5,
      collectionImg: AppImages.collection5,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection6,
      collectionImg: AppImages.collection6,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection7,
      collectionImg: AppImages.collection7,
    ),
    CollectionInfo(
      backColor: AppColors.kCollection8,
      collectionImg: AppImages.collection8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection',
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
        itemCount: collectionList.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10,mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Get.to(()=> ProductDetailScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: collectionList[index].backColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Image(
                    image: AssetImage(collectionList[index].collectionImg),
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


/*GridView.builder(
        itemCount: collectionList.length,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
        ),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: collectionList[index].backColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Image(
                  image: AssetImage(collectionList[index].collectionImg),
                ),
              ),
            ),
          );
        },
      )*/


/*StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: collectionList.length,
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
        mainAxisSpacing: 8, crossAxisSpacing: 8,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: collectionList[index].backColor,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Image(
                  image: AssetImage(collectionList[index].collectionImg),
                ),
              ),
            ),
          );
        },
      )*/