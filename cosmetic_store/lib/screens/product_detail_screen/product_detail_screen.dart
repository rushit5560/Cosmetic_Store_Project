import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_detail_screen_widgets.dart';


class ProductDetailScreen extends StatelessWidget {
  ProductDetailsScreenController productDetailsScreenController = Get.put(ProductDetailsScreenController());
  TextEditingController reviewFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: Obx(
        () => productDetailsScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      ProductDetails(),
                      SizedBox(height: 15),
                      ShowReviews(),
                      SizedBox(height: 15),
                      GiveReview(reviewFieldController: reviewFieldController),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

}
