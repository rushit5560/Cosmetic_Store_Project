import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/common/read_more_text.dart';
import 'package:cosmetic_store/controllers/product_details_screen_controller/product_details_screen_controller.dart';
import 'package:cosmetic_store/models/product_detail_screen_model/get_product_review_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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
                      productDetails(),
                      SizedBox(height: 15),
                      showReviews(),
                      SizedBox(height: 15),
                      giveReview(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget productDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
            '${productDetailsScreenController.productDetailLists[0].productname}',
          maxLines: 2,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '\$${productDetailsScreenController.productDetailLists[0].productcost}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: AppColors.kTometoColor,
          ),
        ),
        SizedBox(height: 15),
        Stack(
          children: [
            Container(
              height: Get.width * 0.50, width: Get.width * 0.50,
              decoration: BoxDecoration(
                color: AppColors.kCollection1,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            ApiUrl.ApiMainPath +
                              "${productDetailsScreenController.productDetailLists[0].images[0]}"
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: -5,
              bottom: 14,
              child: Container(
                child: IconButton(
                  onPressed: () {
                    productDetailsScreenController.productAddToCart();
                  },
                  icon: Icon(Icons.add_shopping_cart_rounded),
                  iconSize: 28,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        relatedProductList(),
        SizedBox(height: 15),
        Container(
          child: ReadMoreText(
            '${productDetailsScreenController.productDetailLists[0].fullText}',
            trimLines: 4,
            colorClickableText: AppColors.kTometoColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...More',
            trimExpandedText: ' Less',
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }

  Widget relatedProductList() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: productDetailsScreenController.productDetailLists[0].images.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          final imgUrl = ApiUrl.ApiMainPath + '${productDetailsScreenController.productDetailLists[0].images[index]}';
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100, width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kCollection2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image(
                  image: NetworkImage('$imgUrl'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget showReviews() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ListView.builder(
            itemCount: productDetailsScreenController.viewMoreValue.value ? productDetailsScreenController.productReviewList.length : 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              Datum1 productSingleReview = productDetailsScreenController.productReviewList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  children: [
                    // Container(
                    //   width: 50, height: 50,
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //     image: DecorationImage(
                    //       image: AssetImage(reviewList[index].imgUrl),
                    //       fit: BoxFit.cover,
                    //     )
                    //   ),
                    // ),
                    // SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                    '${productSingleReview.username}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  child: RatingBar.builder(
                                    itemCount: 5,
                                    ignoreGestures: true,
                                    unratedColor: AppColors.kLightYellowColor,
                                    allowHalfRating: true,
                                    itemSize: 15,
                                    minRating: 1,
                                    glow: false,
                                    initialRating: productSingleReview.ratings.toDouble(),
                                    itemBuilder: (context, _) {
                                      return Icon(
                                        Icons.star_rounded,
                                        color: AppColors.kYellowColor,
                                      );
                                    },
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Text(
                                productSingleReview.comment,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
              productDetailsScreenController.viewMoreValue.value = !productDetailsScreenController.viewMoreValue.value;

              print("viewMoreValue : ${productDetailsScreenController.viewMoreValue.value}");
            },
            child: Text(
              productDetailsScreenController.viewMoreValue.value ? 'View Less' : 'View More',
              textScaleFactor: 1.1,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
              ),

            ),
          ),
        ),
      ],
    );
  }

  Widget giveReview() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Give Review',
            textScaleFactor: 1.3,
            maxLines: 1,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          RatingBar.builder(
            itemCount: 5,
            unratedColor: AppColors.kLightYellowColor,
            allowHalfRating: true,
            itemSize: 18,
            minRating: 1,
            glow: false,
            initialRating: 0,
            itemBuilder: (context, _) {
              return Icon(
                Icons.star_rounded,
                color: AppColors.kYellowColor,
              );
            },
            onRatingUpdate: (rating) {
              productDetailsScreenController.reviewRating = rating;
            },
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: reviewFieldController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Comment',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              productDetailsScreenController.addProductReview(
                  "${productDetailsScreenController.reviewRating}",
                  "${reviewFieldController.text.trim()}");
              reviewFieldController.clear();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.kTometoColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
