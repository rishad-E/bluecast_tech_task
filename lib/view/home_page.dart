import 'package:cart_task/controller/cartcontroller.dart';
import 'package:cart_task/utils/const/colors.dart';
import 'package:cart_task/view/cart_screen.dart';
import 'package:cart_task/widgets/appbar.dart';
import 'package:cart_task/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 246, 248),
      appBar: appBarWidget('Products'),
      body: GetBuilder<CartController>(
        id: 'products',
        builder: (c) {
          return c.isLoading
              ? Center(child: CircularProgressIndicator())
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: 4 / 5.5,
                  ),
                  padding: EdgeInsets.all(8.0),
                  itemCount: c.products.length,
                  itemBuilder: (context, index) {
                    final data = c.products[index];
                    return productHome(
                      title: data.title,
                      image: data.image,
                      price: data.price.toString(),
                      rating: data.rating.rate.toString(),
                      isAdded: c.cart.any((item) => item.id == data.id),
                      onPressed: () => c.addtoCart(data),
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: kwhite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search, color: kwhite),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border_outlined, color: kwhite),
              onPressed: () => Get.to(() => CartScreen()),
            ),
            IconButton(
              icon: Icon(Icons.account_circle_outlined, color: kwhite),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
