import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cart_screen_widgets.dart';

class CartScreen extends StatelessWidget {
  CartScreenController cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    cartScreenController.getUserDetailsFromPrefs();
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),

        body: Obx(
            ()=> cartScreenController.isLoading.value
            ? CustomCircularProgressIndicator()
            : SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      CartItemsListModule(),
                      const SizedBox(height: 10),
                      CouponCodeField(),
                      const SizedBox(height: 10),
                      SubTotal(),
                      Tax(),
                      Discount(),
                      Total(),
                      const SizedBox(height: 20),
                      CheckoutButton(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }


}
