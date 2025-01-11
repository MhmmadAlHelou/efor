import 'package:cached_network_image/cached_network_image.dart';
import 'package:efor/core/constant/color.dart';
import 'package:efor/link_api.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageName,
    required this.onAdd,
    required this.onRemove,
  });

  final String name;
  final String price;
  final String count;
  final String imageName;
  final void Function() onAdd;
  final void Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: "${AppLink.imageItems}/$imageName",
                height: 80,
                // fit: BoxFit.cover,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 14)),
                subtitle: Text(
                  price,
                  style: const TextStyle(color: AppColor.white, fontSize: 16),
                ),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                height: 30,
                child: IconButton(
                  onPressed: onAdd,
                  icon: const Icon(Icons.add),
                ),
              ),
              Text(
                count,
                style: const TextStyle(fontFamily: 'sans'),
              ),
              SizedBox(
                height: 30,
                child: IconButton(
                  onPressed: onRemove,
                  icon: const Icon(Icons.remove),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
