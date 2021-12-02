import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/common/custom_drawer.dart';
import 'package:cosmetic_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/category_screen/category_screen.dart';
import 'package:cosmetic_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/home_screen_model/newarrivals_model.dart';

class HomeScreen extends StatelessWidget {

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final categoryList = [
    AppImages.category1,
    AppImages.category2,
    AppImages.category3,
    AppImages.category4,
    AppImages.category5,
    AppImages.category6,
    AppImages.category7,
    AppImages.category8,
    AppImages.category9,
    AppImages.category10,
    AppImages.category11,
    AppImages.category12,
    AppImages.category11,
    AppImages.category12,
    AppImages.category11,
    AppImages.category12,
  ];

  List<NewArrivalsModel> newArrivalsList = [
    NewArrivalsModel(
      imgUrl: AppImages.collection1,
      productTitle: 'Product Name 12121',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection2,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection3,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection4,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection5,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection6,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection7,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection8,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection1,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection2,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection3,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection4,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection5,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection6,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection7,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AppImages.collection8,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => CartScreen());
            },
            icon: Icon(Icons.shopping_cart_rounded),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          carouselSlider(),
                          Positioned(
                            bottom: 5,
                            child: carouselIndicator(),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      category(),
                      SizedBox(height: 15),
                      newArrivals(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: homeScreenController.bannerLists.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = ApiUrl.ApiMainPath +
            "${homeScreenController.bannerLists[index].imagePath}";
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: 160,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            homeScreenController.activeIndex.value = index;
          }),
    );
  }

  //Carousel Slider Image
  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }

  Widget carouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: homeScreenController.activeIndex.value,
      count: homeScreenController.bannerLists.length,
      effect: WormEffect(
        dotHeight: 11,
        dotWidth: 11,
        activeDotColor: AppColors.kTometoColor,
        dotColor: Colors.white,
      ),
    );
  }

  Widget category() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.black,
            )),
            SizedBox(width: 10),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 2),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          child: GridView.builder(
            itemCount: categoryList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: GestureDetector(
                  onTap: () {
                    print('Clicked On Index Number : $index');
                    Get.to(() => CategoryScreen());
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
                            )),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget newArrivals() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'New Arrivals',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 2),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Divider(
              thickness: 2,
              color: Colors.black,
            )),
          ],
        ),
        GridView.builder(
          itemCount: newArrivalsList.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => ProductDetailScreen());
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kCollection1),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(newArrivalsList[index].imgUrl),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    newArrivalsList[index].productTitle,
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '\$${newArrivalsList[index].productPrice}',
                    style: TextStyle(
                      color: AppColors.kTometoColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
