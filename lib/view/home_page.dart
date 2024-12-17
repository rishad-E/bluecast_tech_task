import 'package:cart_task/controller/cartcontroller.dart';
import 'package:cart_task/model/cart_model.dart';
import 'package:cart_task/view/cart_screen.dart';
import 'package:cart_task/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products'),
        centerTitle: true,
        // elevation: 3,
      ),
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
                    childAspectRatio: 4.5 / 5,
                  ),
                  padding: EdgeInsets.all(8.0), // padding around the grid
                  itemCount: c.products.length,
                  itemBuilder: (context, index) {
                    final data = c.products[index];
                    return productHome(
                      title: data.title,
                      image: data.image,
                      price: data.price.toString(),
                      rating: data.rating.rate.toString(),
                      isAdded: c.cart.any(
                        (item) => item.title == data.title,
                      ),
                      onPressed: () {
                        CartModel model = CartModel(
                          title: data.title,
                          image: data.image,
                          price: data.price,
                          rating: data.rating,
                          id: data.id,
                          description: data.description,
                          category: data.category,
                        );
                        c.addtoCart(model);
                      },
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                onPressed: () => Get.to(() => CartScreen()),
              ),
              IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
