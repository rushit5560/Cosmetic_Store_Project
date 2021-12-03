import 'package:cosmetic_store/common/app_color.dart';
import 'package:cosmetic_store/controllers/edit_profile_screen_controller/edit_profile_screen_controller.dart';
import 'package:cosmetic_store/models/edit_profile_screen_model/city_model.dart';
import 'package:cosmetic_store/models/edit_profile_screen_model/country_model.dart';
import 'package:cosmetic_store/models/edit_profile_screen_model/state_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UserNameField extends StatelessWidget {
  TextEditingController userNameController;
  UserNameField({required this.userNameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'UserName',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.black,
          controller: userNameController,
          validator: (value) {
            if(value!.isEmpty){
              return 'UserName can\'t be Null';
            }
          },
          decoration: _inputDecoration(30),
        ),
      ],
    );
  }
  InputDecoration _inputDecoration(double radius) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius)
      ),
    );
  }
}

class CountryDropDownModule extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<Datum>(
          value: editProfileScreenController.countryDropDownValue,
          icon:
          const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.countryDropDownValue!.name =
                newValue!.name;
            editProfileScreenController.countryDropDownValue!.id = newValue.id;
            print(
                "countryDropDownValue : ${editProfileScreenController.countryDropDownValue!.name}");
            print("countryDropDownValue ID : ${newValue.id}");
            editProfileScreenController.getStateData(newValue.id);
          },
          items: editProfileScreenController.countryLists
              .map<DropdownMenuItem<Datum>>((Datum value) {
            return DropdownMenuItem<Datum>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class StateDropDownModule extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumState>(
          value: editProfileScreenController.stateDropDownValue,
          icon:
          const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.stateDropDownValue!.name =
                newValue!.name;
            editProfileScreenController.stateDropDownValue!.id = newValue.id;
            print(
                "stateDropDownValue : ${editProfileScreenController.stateDropDownValue}");
            print('newValue.name : ${newValue.name}');
            editProfileScreenController.getCityData(newValue.id);
            editProfileScreenController.loading();
          },
          items: editProfileScreenController.stateLists
              .map<DropdownMenuItem<DatumState>>((DatumState value) {
            return DropdownMenuItem<DatumState>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CityDropDownModule extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        width: Get.width,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: Colors.grey),
        ),
        child: DropdownButton<DatumCity>(
          value: editProfileScreenController.cityDropDownValue,
          icon:
          const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
          style: const TextStyle(color: Colors.grey),
          isExpanded: true,
          underline: Container(
            height: 1,
            color: Colors.white,
          ),
          onChanged: (newValue) {
            editProfileScreenController.cityDropDownValue!.name =
                newValue!.name;
            editProfileScreenController.cityDropDownValue!.id = newValue.id;
            print(
                "cityDropDownValue : ${editProfileScreenController.cityDropDownValue}");
            print('newValue.name : ${newValue.name}');
            editProfileScreenController.loading();
          },
          items: editProfileScreenController.cityLists
              .map<DropdownMenuItem<DatumCity>>((DatumCity value) {
            return DropdownMenuItem<DatumCity>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  final editProfileScreenController = Get.find<EditProfileScreenController>();
  GlobalKey<FormState> formKey;
  TextEditingController userNameController;


  UpdateButton({required this.formKey, required this.userNameController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {

          if(editProfileScreenController.countryDropDownValue!.name == "Select Country"){
            Fluttertoast.showToast(msg: 'Please Select Country', toastLength: Toast.LENGTH_LONG);
          }
          else if(editProfileScreenController.stateDropDownValue!.name == "Select State"){
            Fluttertoast.showToast(msg: 'Please Select State', toastLength: Toast.LENGTH_LONG);
          }
          else if (editProfileScreenController.cityDropDownValue!.name == "Select City") {
            Fluttertoast.showToast(msg: 'Please Select City', toastLength: Toast.LENGTH_LONG);
          } else {
            editProfileScreenController.updateProfileData("${userNameController.text.trim()}");
            clearTextFields();
          }
        }

      },
      child: Container(
        width: Get.width,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.kTometoColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            'Update Profile',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  clearTextFields() {
    userNameController.clear();
    // emailIdController.clear();
    // phoneNoController.clear();
    // addressController.clear();
    // shippingAddressController.clear();
    // passwordController.clear();
  }
}
