import 'package:efor/controller/address/view_controller.dart';
import 'package:efor/core/class/handling_data_view.dart';
import 'package:efor/core/constant/routes.dart';
import 'package:efor/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewController());
    return Scaffold(
      appBar: AppBar(title: const Text('Adress')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressAdd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<AddressViewController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) {
              return CardAddress(
                addressModel: controller.data[index],
                onDelete: () {
                  controller
                      .deleteData(controller.data[index].addressId.toString());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  const CardAddress({Key? key, required this.addressModel, this.onDelete})
      : super(key: key);

  final AddressModel addressModel;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(10),
      child: ListTile(
        title: Text(addressModel.addressName!),
        subtitle:
            Text('${addressModel.addressCity} ${addressModel.addressStreet}'),
        trailing: IconButton(
            onPressed: onDelete, icon: const Icon(Icons.delete_outline)),
      ),
    ));
  }
}
