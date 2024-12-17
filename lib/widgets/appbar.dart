import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(String title) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
    ),
    centerTitle: true,
    surfaceTintColor: Colors.white,
    elevation: 7,
    shadowColor: Colors.black.withOpacity(0.5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
    ),
  );
}
