import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/common/app_images.dart';
import 'package:cosmetic_store/screens/confirmation_screen/confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethodsModule extends StatelessWidget {
  const PaymentMethodsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Method',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 25,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image(
                    image: AssetImage(AppImages.paypal),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image(
                    image: AssetImage(AppImages.visa),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image(
                    image: AssetImage(AppImages.mastercard),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Image(
                    image: AssetImage(AppImages.card),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PaymentDetailsModule extends StatelessWidget {
  GlobalKey<FormState> formKey;
  TextEditingController cardNoController;
  TextEditingController expDateController;
  TextEditingController cvvController;
  TextEditingController cardHolderNameController;

  PaymentDetailsModule({
    required this.formKey,
    required this.cardNoController,
    required this.expDateController,
    required this.cvvController,
    required this.cardHolderNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'payment Detail',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          cardNumberField(),
          SizedBox(height: 10),
          expDateAndCvv(),
          SizedBox(height: 10),
          cardHolderNameField(),
        ],
      ),
    );
  }

  Widget cardNumberField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Card Number'),
          ),
          SizedBox(height: 8),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              maxLength: 16,
              cursorColor: AppColors.kTometoColor,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                contentPadding:
                EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.kTometoColor),
                    borderRadius: BorderRadius.circular(25)),
              ),
              controller: cardNoController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Card No. cannot be empty";
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget expDateAndCvv() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('Exp. Date MM/YY'),
              ),
              SizedBox(height: 8),
              Container(
                child: TextFormField(
                  maxLength: 5,
                  cursorColor: AppColors.kTometoColor,
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: '',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kTometoColor),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  controller: expDateController,
                  validator: (value) {
                    if (value!.isEmpty /* || value.length == null*/) {
                      return "Date cannot be empty";
                    } else if (!value.contains('/')) {
                      return 'Date Format is Not valid';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text('CVV'),
              ),
              SizedBox(height: 5),
              Container(
                child: TextFormField(
                  cursorColor: AppColors.kTometoColor,
                  keyboardType: TextInputType.number,
                  maxLength: 3,
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: '',
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.kTometoColor),
                        borderRadius: BorderRadius.circular(25)),
                  ),
                  controller: cvvController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "CVV cannot be empty";
                    } else if (value.length != 3) {
                      return 'CVV Must be in 3 Digit';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget cardHolderNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Card Holder Name',
            style: TextStyle(fontSize: 15),
          ),
        ),
        SizedBox(height: 10),
        Container(
          child: TextFormField(
            cursorColor: AppColors.kTometoColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kTometoColor),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: cardHolderNameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Card Holder Name cannot be empty";
              }
            },
          ),
        ),
      ],
    );
  }
}

class ConfirmationButton extends StatelessWidget {
  String? cardNo, expDate, cvv, cardHolderName;
  GlobalKey<FormState> formKey;
  TextEditingController cardNoController;
  TextEditingController expDateController;
  TextEditingController cvvController;
  TextEditingController cardHolderNameController;

  ConfirmationButton({
    required this.formKey,
    required this.cardNoController,
    required this.expDateController,
    required this.cvvController,
    required this.cardHolderNameController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
            cardNo = cardNoController.text.trim();
            expDate = expDateController.text.trim();
            cvv = cvvController.text.trim();
            cardHolderName = cardHolderNameController.text.trim();
            print('$cardNo \n$expDate \n$cvv \n$cardHolderName');
            Get.to(()=> ConfirmationScreen());
            clearTextFields();
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: AppColors.kTometoColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 11),
              child: Text(
                'Continue To Confirmation',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clearTextFields() {
    cardNoController.clear();
    expDateController.clear();
    cvvController.clear();
    cardHolderNameController.clear();
  }
}
