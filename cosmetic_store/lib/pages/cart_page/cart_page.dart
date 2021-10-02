import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:cosmetic_store/pages/cart_page/cart_model.dart';
import 'package:cosmetic_store/pages/checkout_page/checkout_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {

  List<SingleCartItem> cartItems = [
    SingleCartItem(
      productImgUrl: AssetsImageUrl.collection1,
      productName: 'lorem ipsum dolor sit',
      activeAmount: '50',
    ),
    SingleCartItem(
      productImgUrl: AssetsImageUrl.collection2,
      productName: 'lorem ipsum dolor sit',
      activeAmount: '70',
    ),
    SingleCartItem(
      productImgUrl: AssetsImageUrl.collection3,
      productName: 'lorem ipsum dolor sit',
      activeAmount: '85',
    ),
    SingleCartItem(
      productImgUrl: AssetsImageUrl.collection4,
      productName: 'lorem ipsum dolor sit',
      activeAmount: '99',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),

        body: SingleChildScrollView(
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
    );
  }


  Widget cartItemsList() {
    return Container(
      child: ListView.builder(
        itemCount: cartItems.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
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
                            color: CustomColor.kCollection1,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Image(
                                image: AssetImage(cartItems[index].productImgUrl),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(width: 10),

                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(cartItems[index].productName),
                              SizedBox(height: 5),
                              Text(
                                  '\$${cartItems[index].activeAmount}',
                                style: TextStyle(
                                  color: CustomColor.kTometoColor,
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
                          width: 50,
                          height: 25,
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1)
                            ],
                            style: TextStyle(
                              fontSize: 12,
                            ),
                            cursorColor: Colors.black,
                            initialValue: '1',
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                left: 10, right: 10,
                                bottom: 10,top: 10,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: CustomColor.kTometoColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: CustomColor.kTometoColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.delete_rounded),
                            color: Colors.red,
                            onPressed: () {print('Delete Button Clicked');},
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
          cursorColor: CustomColor.kTometoColor,
          decoration: InputDecoration(
            fillColor: CustomColor.kTometoColor,
            hintText: "Promo Code",
            isDense: true,
            contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  color: CustomColor.kTometoColor, width: 2, style: BorderStyle.solid),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.kTometoColor),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: CustomColor.kTometoColor),
              borderRadius: BorderRadius.circular(20),
            ),
            suffixIcon: Container(
              width: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CustomColor.kTometoColor,
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
              Text('\$400.00',
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
              Text('\$450.00',
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
              Get.to(CheckOutPage());
            },
            child: Container(
              width: Get.width * 0.40,
              decoration: BoxDecoration(
                  color: CustomColor.kTometoColor,
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
