import 'dart:developer';

import 'package:cart_task/model/cart_model.dart';
import 'package:cart_task/service/service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> products = [];
  List<CartModel> cart = [];
  bool isLoading = false;
  RxDouble price = 0.0.obs;
  Map<List<CartModel>, int> cartItems = {};
  Future<void> getAllProducts() async {
    try {
      isLoading = true;
      List<CartModel>? data = await CartService().fetchProduct();
      if (data != null) {
        products.assignAll(data);
        update(['products']);
      }
    } catch (e) {
      log(e.toString(), name: 'c-error');
    } finally {
      isLoading = false;
    }
  }

  void addtoCart(CartModel model) {
    cart.add(model);

    for (var item in cart) {
      price.value = item.price + price.value;
    }

    log(cart.length.toString());
    update(['products']);
    update(['cart-items']);
  }

  void deleteProduct(int index, double productprice) {
    cart.removeAt(index);
    price.value = price.value - productprice;
    update(['products']);
    update(['cart-items']);
  }

  void updateCartItem(CartModel model) {
    for (var item in cartItems.entries) {
      if (item.key.single.title == model.title) {
        // cartItems[item.key] = ((cartItems[item.key[model]])! + 1) ;
        log(item.key.single.title);
      }
    }
  }
}
