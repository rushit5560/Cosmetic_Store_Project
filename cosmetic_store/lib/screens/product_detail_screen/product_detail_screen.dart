import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/read_more_text.dart';
import 'package:cosmetic_store/models/product_detail_screen_model/review_model.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  List relatedImgList = [
    AppImages.collection2,
    AppImages.collection3,
    AppImages.collection4,
    AppImages.collection4,
    AppImages.collection4,
  ];

  String desText =
      'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD, 120Hz Refresh Rate, IPS-level Anti-Glare Panel, 100% DCI-P3, Pantone Validated Graphics: Dedicated NVIDIA GeForce RTX 3060 GDDR6 6GB VRAM, With ROG Boost up to 1382MHz at 60W TGP + 20W with Dynamic Boost';

  List<ReviewInfo> reviewList = [
    ReviewInfo(
      imgUrl: AppImages.profile,
      userName: 'Tokyo',
      stars: '4',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: AppImages.profile,
      userName: 'Arturito',
      stars: '4.5',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: AppImages.profile,
      userName: 'Berline',
      stars: '4.5',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: AppImages.profile,
      userName: 'Neirobi',
      stars: '4.5',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: AppImages.profile,
      userName: 'Tokyo',
      stars: '4',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: AppImages.profile,
      userName: 'Tokyo',
      stars: '4',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
  ];

  bool viewMoreValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description',
          style: TextStyle(color: Colors.black),
        ),
      ),

      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              productDetails(),
              SizedBox(height: 15),
              showReviews(),
            ],
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
            'Lorem ipsum dolor sit',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        Text(
          '\$50',
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
                          image: AssetImage(AppImages.collection1),
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
                    Get.to(()=> CartScreen());
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
            desText,
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
        itemCount: relatedImgList.length,
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100, width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kCollection2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(relatedImgList[index]),
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
            itemCount: viewMoreValue ? reviewList.length : 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 50, height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(reviewList[index].imgUrl),
                          fit: BoxFit.cover,
                        )
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    reviewList[index].userName,
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
                                    // initialRating: 3,
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
                                  reviewList[index].description,
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
              setState(() {
                viewMoreValue = !viewMoreValue;
              });
              print(viewMoreValue);
            },
            child: Text(
              viewMoreValue ? 'View Less' : 'View More',
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
}
