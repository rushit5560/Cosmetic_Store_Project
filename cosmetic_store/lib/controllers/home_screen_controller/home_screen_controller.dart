import 'dart:convert';
import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/models/home_screen_model/banner_model.dart';
import 'package:cosmetic_store/models/home_screen_model/featured_product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  RxInt activeIndex = 0.obs;
  RxList<Datum> bannerLists = RxList();
  RxList<Datum1> featuredProductLists = RxList();

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


  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if(isStatus.value){
        bannerLists = bannerList.data.obs;
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      isLoading(false);
    }
    getFeaturedProductData();
  }

  getFeaturedProductData() async {
    isLoading(true);
    String url = ApiUrl.FeaturedProductApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      FeaturedProductData featuredProductData = FeaturedProductData.fromJson(json.decode(response.body));
      isStatus = featuredProductData.success.obs;

      if(isStatus.value) {
        featuredProductLists = featuredProductData.data.obs;
      } else {
        print('FeaturedProduct False False');
      }
    } catch(e) {
      print('FeaturedProduct Error : $e');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }
}