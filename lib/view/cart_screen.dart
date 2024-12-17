import 'package:cart_task/controller/cartcontroller.dart';
import 'package:cart_task/widgets/appbar.dart';
import 'package:cart_task/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('My Cart'),
      body: GetBuilder<CartController>(
        id: 'cart-items',
        builder: (c) {
          return c.cart.isEmpty
              ? Center(child: Text('Cart is empty'))
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemCount: c.cart.length,
                    itemBuilder: (context, index) {
                      final data = c.cart[index];
                      return cartItems(
                        image: data.image,
                        title: data.title,
                        price: data.price.toString(),
                        quantity: '${c.productQuantities[data.id] ?? 1}',
                        onPressRemove: () => c.removeItemQuantity(data.id),
                        onPressAdd: () => c.addItemQuantity(data.id),
                        onPressDelete: () => c.deleteProduct(index),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 5),
                  ),
                );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                '₹ ${controller.price.toString()}',
                style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'proceed to checkout',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
