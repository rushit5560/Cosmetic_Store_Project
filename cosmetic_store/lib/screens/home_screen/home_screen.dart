import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/common/custom_drawer.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:cosmetic_store/screens/category_screen/category_screen.dart';
import 'package:cosmetic_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/home_screen_model/newarrivals_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int activeIndex = 0;

  List bannerImgList = [
    AssetsImageUrl.banner1,
    AssetsImageUrl.banner2,
    AssetsImageUrl.banner3,
  ];

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

  List<NewArrivalsModel> newArrivalsList = [
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection1,
      productTitle: 'Product Name 12121',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection2,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection3,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection4,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection5,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection6,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection7,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection8,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection1,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection2,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection3,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection4,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection5,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection6,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection7,
      productTitle: 'Product Name',
      productPrice: '50',
    ),
    NewArrivalsModel(
      imgUrl: AssetsImageUrl.collection8,
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
              Get.to(()=> CartScreen());
            },
            icon: Icon(Icons.shopping_cart_rounded),
          )
        ],
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
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
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: bannerImgList.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = bannerImgList[index];
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: 160,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
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
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }

  Widget carouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: bannerImgList.length,
      effect: WormEffect(
        dotHeight: 11,
        dotWidth: 11,
        activeDotColor: CustomColor.kTometoColor,
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
            Expanded(child: Divider(thickness: 2,color: Colors.black,)),
            SizedBox(width: 10),
            Container(
              width: 10, height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 2),
            Container(
              width: 10, height: 10,
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
                    Get.to(()=> CategoryScreen());
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
              width: 10, height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 2),
            Container(
              width: 10, height: 10,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 10),
            Expanded(child: Divider(thickness: 2,color: Colors.black,)),



          ],
        ),

        GridView.builder(
          itemCount: newArrivalsList.length,
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10, mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: () {
                Get.to(()=> ProductDetailScreen());
              },
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColor.kCollection1
                      ),
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
                      color: Colors.black, fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3),
                  Text(
                    '\$${newArrivalsList[index].productPrice}',
                    style: TextStyle(
                      color: CustomColor.kTometoColor,
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
