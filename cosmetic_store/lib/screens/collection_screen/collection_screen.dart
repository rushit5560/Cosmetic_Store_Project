import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CollectionScreen extends StatelessWidget {
  CollectionScreenController collectionScreenController = Get.put(CollectionScreenController());

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

      body: Obx(
        () => collectionScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : GridView.builder(
                itemCount: collectionScreenController.collectionLists.length,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final imgUrl = ApiUrl.ApiMainPath +
                      '${collectionScreenController.collectionLists[index].showimg}';
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ProductDetailScreen(),
                          arguments: collectionScreenController.collectionLists[index].id,
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