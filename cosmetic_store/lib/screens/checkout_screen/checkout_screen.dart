import 'package:flutter/material.dart';
import 'checkout_screen_widgets.dart';

class CheckOutScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();
  String? cardNo, expDate, cvv, cardHolderName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'CheckOut',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 15),
                PaymentMethodsModule(),
                SizedBox(height: 20),
                PaymentDetailsModule(
                  formKey: formKey,
                  cardNoController: cardNoController,
                  expDateController: expDateController,
                  cvvController: cvvController,
                  cardHolderNameController: cardHolderNameController,
                ),
                SizedBox(height: 20),
                ConfirmationButton(
                  formKey: formKey,
                  cardNoController: cardNoController,
                  expDateController: expDateController,
                  cvvController: cvvController,
                  cardHolderNameController: cardHolderNameController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
