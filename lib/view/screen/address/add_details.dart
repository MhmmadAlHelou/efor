import 'package:efor/controller/address/add_details_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/widgets/custom_buttom.dart';
import 'package:efor/view/widget/auth/custom_text_form_auyh.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddDetails extends StatelessWidget {
  const AddressAddDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressDetailsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Add Adress Details')),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<AddAddressDetailsController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                CustomTextFormAuth(
                  hintText: 'Name',
                  labelText: 'Name',
                  iconData: Icons.person,
                  myController: controller.name!,
                  valid: (val) {
                    return null;
                  },
                  isNumber: false,
                ),
                CustomTextFormAuth(
                  hintText: 'City',
                  labelText: 'City',
                  iconData: Icons.location_city,
                  myController: controller.city!,
                  valid: (val) {
                    return null;
                  },
                  isNumber: false,
                ),
                CustomTextFormAuth(
                  hintText: 'Street',
                  labelText: 'Street',
                  iconData: Icons.streetview,
                  myController: controller.street!,
                  valid: (val) {
                    return null;
                  },
                  isNumber: false,
                ),
                CustomButtom(
                  text: 'Add',
                  onPressed: () {
                    controller.addAddress();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
