import 'package:cart_task/controller/cartcontroller.dart';
import 'package:cart_task/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my cart'),
        centerTitle: true,
      ),
      body: GetBuilder<CartController>(
        id: 'cart-items',
        builder: (c) {
          return c.cart.isEmpty
              ? Center(child: Text('Cart is empty'))
              : ListView.separated(
                  itemCount: c.cart.length,
                  itemBuilder: (context, index) {
                    final data = c.cart[index];
                    return ListTile(
                      tileColor: const Color.fromARGB(255, 232, 229, 229),
                      leading: Image.network(
                        data.image,
                        fit: BoxFit.contain,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data.title,
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'size: XL',
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            data.price.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                // log('item.key.single.title');
                                CartModel model = CartModel(
                                    title: data.title,
                                    image: data.image,
                                    price: data.price,
                                    rating: data.rating,
                                    id: data.id,
                                    description: data.description,
                                    category: data.category);
                                controller.updateCartItem(model);
                              },
                              icon: Icon(Icons.minimize)),
                          Text('1'),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          SizedBox(width: 8),
                          IconButton(
                            onPressed: () => c.deleteProduct(index, data.price),
                            icon: Icon(Icons.delete),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 5),
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
                style: TextStyle(color: Colors.white),
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
