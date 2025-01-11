import 'package:efor/core/constant/color.dart';
import 'package:flutter/material.dart';

class PriceAndCoune extends StatelessWidget {
  const PriceAndCoune({
    super.key,
    required this.onAdd,
    required this.onRemove,
    required this.price,
    required this.count,
  });
  final void Function() onAdd;
  final void Function() onRemove;
  final String price;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Row(
        //   children: [
        IconButton(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
        ),
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(bottom: 10, top: 8),
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.black),
          ),
          child: Text(count, style: const TextStyle(fontSize: 20, height: 1.1)),
        ),
        IconButton(
          onPressed: onRemove,
          icon: const Icon(Icons.remove),
        ),
        //   ],
        // ),
        const Spacer(),
        Text(
          '$price\$',
          style:
              const TextStyle(color: AppColor.white, fontSize: 30, height: 1.1),
        ),
      ],
    );
  }
}
