import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:cosmetic_store/models/home_screen_model/featured_product_model.dart';
import 'package:cosmetic_store/screens/category_screen/category_screen.dart';
import 'package:cosmetic_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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


}

class BannerIndicator extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
}

class CategoryListModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
            itemCount: homeScreenController.categoryList.length,
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
                              image: AssetImage(homeScreenController.categoryList[index]),
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
}

class NewArrivalListModule extends StatelessWidget {
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
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
          itemCount: homeScreenController.featuredProductLists.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            Datum1 featuredProduct = homeScreenController.featuredProductLists[index];
            final imgUrl = ApiUrl.ApiMainPath + '${homeScreenController.featuredProductLists[index].showimg}';
            return GestureDetector(
              onTap: () {
                Get.to(
                      () => ProductDetailScreen(),
                  arguments:
                  homeScreenController.featuredProductLists[index].id,
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kCollection1),
                      child: Padding(
                        padding: const EdgeInsets.all(22),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('$imgUrl'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${featuredProduct.productname}',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '\$${featuredProduct.productcost}',
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
