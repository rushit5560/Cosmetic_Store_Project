import 'package:cosmetic_store/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/screens/category_collection_screen/category_collection_screen.dart';
import 'package:get/get.dart';


class CategoryListModule extends StatelessWidget {
   final categoryScreenController = Get.find<CategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categoryScreenController.categoryLists.length,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        final imgUrl = ApiUrl.ApiMainPath +
            '${categoryScreenController.categoryLists[index].showimg}';
        return Padding(
          padding: const EdgeInsets.all(5),
          child: GestureDetector(
            onTap: () {
              print('Cat Id : ${categoryScreenController.categoryLists[index].categoryId}');
              Get.to(() => CategoryCollectionScreen(),
                  arguments: [
                    categoryScreenController.categoryLists[index].categoryId,
                    categoryScreenController.categoryLists[index].categoryName]
              );
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
                      image: NetworkImage('$imgUrl'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
