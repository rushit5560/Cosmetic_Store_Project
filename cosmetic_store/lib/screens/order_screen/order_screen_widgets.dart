import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/order_screen_controller/order_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderList extends StatelessWidget {
   final orderScreenController = Get.find<OrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: orderScreenController.orderItems.length,
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
                        color: AppColors.kCollection1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image(
                          image: AssetImage(orderScreenController.orderItems[index].imgUrl),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          orderScreenController.orderItems[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '\$${orderScreenController.orderItems[index].amount}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.kTometoColor,
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
                  color: AppColors.kTometoColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    orderScreenController.orderItems[index].qty,
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
