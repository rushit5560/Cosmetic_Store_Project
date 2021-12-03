import 'package:cosmetic_store/controllers/collection_screen_controller/collection_screen_controller.dart';
import 'package:cosmetic_store/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'collection_screen_widgets.dart';


class CollectionScreen extends StatelessWidget {
  CollectionScreenController collectionScreenController = Get.put(CollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(()=> CartScreen());
            },
            icon: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),

      body: CollectionListModule(),
    );
  }
}
