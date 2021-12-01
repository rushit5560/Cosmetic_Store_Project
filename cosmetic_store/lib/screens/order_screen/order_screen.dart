import 'package:cosmetic_store/common/assets_image_url.dart';
import 'package:cosmetic_store/common/custom_color.dart';
import 'package:flutter/material.dart';

import '../../models/order_screen_model/order_model.dart';

class OrderScreen extends StatelessWidget {
  List<OrderInfo> orderItems = [
    OrderInfo(
      imgUrl: AssetsImageUrl.collection1,
      name: 'Product Name One',
      amount: '50',
      qty: '1',
    ),
    OrderInfo(
      imgUrl: AssetsImageUrl.collection2,
      name: 'Product Name Two',
      amount: '50',
      qty: '2',
    ),
    OrderInfo(
      imgUrl: AssetsImageUrl.collection3,
      name: 'Product Name Three',
      amount: '50',
      qty: '1',
    ),
    OrderInfo(
      imgUrl: AssetsImageUrl.collection4,
      name: 'Product Name Four',
      amount: '50',
      qty: '3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders',
          style: TextStyle(color: Colors.black),
        ),
      ),

       body: SingleChildScrollView(
         physics: BouncingScrollPhysics(),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Divider(thickness: 2),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 3),
                 child: Text(
                   '23 Jun 2019',
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 15
                   ),
                 ),
               ),
               Divider(thickness: 2),
               orderList(),
             ],
           ),
         ),
       ),
    );
  }

  Widget orderList() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: orderItems.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      height: 60, width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColor.kCollection1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage(orderItems[index].imgUrl),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderItems[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '\$${orderItems[index].amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColor.kTometoColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                width: 25, height: 25,
                decoration: BoxDecoration(
                  color: CustomColor.kTometoColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                      orderItems[index].qty,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
