import 'package:flutter/material.dart';

Widget productHome(
    {required String title,
    required String image,
    required String rating,
    required String price,
    required bool isAdded,
    required void Function()? onPressed}) {
  return Column(
    children: [
      Expanded(
        child: Container(
          // height: 100,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image)),
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(12)),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(child: Text(title)),
          Text(rating),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(price),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              Icons.favorite,
              color: isAdded ? Colors.red : Colors.black,
            ),
            style: ButtonStyle(visualDensity: VisualDensity.compact),
          ),
        ],
      ),
    ],
  );
}
