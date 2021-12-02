import 'package:cosmetic_store/common/api_url.dart';
import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/common_widgets.dart';
import 'package:cosmetic_store/controllers/cart_screen_controller/cart_screen_controller.dart';
import 'package:cosmetic_store/models/cart_screen_model/cart_model.dart';
import 'package:cosmetic_store/screens/checkout_screen/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                      SizedBox(height: 10),
                      cartItemsList(),
                      SizedBox(height: 10),
                      couponCodeField(),
                      SizedBox(height: 10),
                      subTotal(),
                      tax(),
                      discount(),
                      total(),
                      SizedBox(height: 20),
                      checkoutButton(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      ),
    );
  }


  Widget cartItemsList() {
    return Container(
      child: ListView.builder(
        itemCount: cartScreenController.userCartProductLists.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final imgUrl = ApiUrl.ApiMainPath + "asset/uploads/product/" + '${cartScreenController.userCartProductLists[index].showimg}';
          Cartditeil cartSingleItem = cartScreenController.userCartProductLists[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 70, width: 70,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.kCollection1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              child: Image(
                                image: NetworkImage('$imgUrl'),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartSingleItem.productname),
                              SizedBox(height: 5),
                              Text(
                                  '\$${cartSingleItem.productcost}',
                                style: TextStyle(
                                  color: AppColors.kTometoColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if(cartSingleItem.cquantity > 1) {
                                    int cartQty = cartSingleItem.cquantity;
                                    int cartQtyDec = cartQty - 1;
                                    print('cquantity -- : $cartQtyDec');
                                    cartScreenController.getAddProductCartQty(cartQtyDec, cartSingleItem.cartDetailId);
                                    cartScreenController.getUserDetailsFromPrefs();
                                  }
                                },
                                child: Icon(Icons.remove_rounded),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text('${cartScreenController.userCartProductLists[index].cquantity}'),
                              ),
                              GestureDetector(
                                onTap: () {
                                  int cartQty = cartSingleItem.cquantity;
                                  int cartQtyInc = cartQty + 1;
                                  print('cquantity ++ : $cartQtyInc');
                                  cartScreenController.getAddProductCartQty(cartQtyInc, cartSingleItem.cartDetailId);
                                  cartScreenController.getUserDetailsFromPrefs();
                                },
                                child: Icon(Icons.add_rounded),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.delete_rounded),
                            color: Colors.red,
                            onPressed: () {
                              var cartDetailId = cartSingleItem.cartDetailId;
                              cartScreenController.getDeleteProductCart(cartDetailId);
                              },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget couponCodeField() {
    return Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: TextFormField(
          cursorColor: AppColors.kTometoColor,
          decoration: InputDecoration(
            fillColor: AppColors.kTometoColor,
            hintText: "Promo Code",
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kTometoColor, width: 2, style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kTometoColor),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.kTometoColor),
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: Container(
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.kTometoColor,
              ),
              child: Center(
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget subTotal() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Sub Total',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text('\$${cartScreenController.userCartTotalAmount.value}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget tax() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tax',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text('\$50.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget discount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Discount',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              Text('\$00.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget total() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('\$${cartScreenController.userCartTotalAmount.value}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget checkoutButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: GestureDetector(
            onTap: () {
              print('Proceed Button');
              Get.to(()=> CheckOutScreen());
            },
            child: Container(
              width: Get.width * 0.40,
              decoration: BoxDecoration(
                  color: AppColors.kTometoColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 11),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }

}
