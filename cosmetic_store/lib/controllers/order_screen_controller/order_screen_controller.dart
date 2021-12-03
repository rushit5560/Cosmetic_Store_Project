import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/models/order_screen_model/order_model.dart';
import 'package:get/get.dart';

class OrderScreenController extends GetxController {

  List<OrderInfo> orderItems = [
    OrderInfo(
      imgUrl: AppImages.collection1,
      name: 'Product Name One',
      amount: '50',
      qty: '1',
    ),
    OrderInfo(
      imgUrl: AppImages.collection2,
      name: 'Product Name Two',
      amount: '50',
      qty: '2',
    ),
    OrderInfo(
      imgUrl: AppImages.collection3,
      name: 'Product Name Three',
      amount: '50',
      qty: '1',
    ),
    OrderInfo(
      imgUrl: AppImages.collection4,
      name: 'Product Name Four',
      amount: '50',
      qty: '3',
    ),
  ];
}