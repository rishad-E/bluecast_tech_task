import 'package:cart_task/utils/const/colors.dart';
import 'package:flutter/material.dart';

Widget productHome(
    {required String title,
    required String image,
    required String rating,
    required String price,
    required bool isAdded,
    required void Function()? onPressed}) {
  return Container(
    decoration: BoxDecoration(
        color: const Color.fromARGB(176, 244, 142, 40),
        borderRadius: BorderRadius.circular(12)),
    child: Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: double.infinity,
              child: Image.network(image, fit: BoxFit.fill),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: Text(
                    title,
                    style: TextStyle(fontSize: 12),
                    maxLines: 2,
                  )),
                  choiceBox(width: 5),
                  Text(
                    "⭐ $rating",
                  ),
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
          ),
        ),
      ],
    ),
  );
}

Widget cartItems({
  required String image,
  required String title,
  required String price,
  required String quantity,
  required void Function()? onPressRemove,
  required void Function()? onPressAdd,
  required void Function()? onPressDelete,
}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color.fromARGB(175, 247, 184, 122),
      borderRadius: BorderRadius.circular(12)
    ),
    child: ListTile(
      // tileColor: const Color.fromARGB(176, 244, 142, 40),
      leading: Image.network(
        image,
        fit: BoxFit.contain,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            overflow: TextOverflow.clip,
            maxLines: 2,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Text(
            'size: XL',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            price,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onPressRemove, icon: Icon(Icons.remove)),
          Text(
            quantity,
            style: TextStyle(
                color: kwhite, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(onPressed: onPressAdd, icon: Icon(Icons.add)),
          SizedBox(width: 8),
          IconButton(
            onPressed: onPressDelete,
            icon: Icon(Icons.delete),
          )
        ],
      ),
    ),
  );
}

Widget choiceBox({double? height, double? width}) {
  return SizedBox(
    height: height,
    width: width,
  );
}
