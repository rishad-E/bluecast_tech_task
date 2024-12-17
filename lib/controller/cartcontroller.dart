import 'dart:developer';

import 'package:cart_task/model/cart_model.dart';
import 'package:cart_task/service/service.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  List<CartModel> products = [];
  List<CartModel> cart = [];
  bool isLoading = false;
  RxDouble price = 0.0.obs;

  Map<int, int> productQuantities = {};
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
    if (!cart.any((item) => item.id == model.id)) {
      cart.add(model);
      productQuantities[model.id] = 1;
    } else {
      productQuantities[model.id] = productQuantities[model.id]! + 1;
    }
    totalPrice();
    update(['cart-items']);
    update(['products']);
  }

  void addItemQuantity(int productId) {
    if (productQuantities.containsKey(productId)) {
      productQuantities[productId] = productQuantities[productId]! + 1;
      totalPrice();
      update(['cart-items']);
    }
  }

  void removeItemQuantity(int productId) {
    if (productQuantities.containsKey(productId) &&
        productQuantities[productId]! > 1) {
      productQuantities[productId] = productQuantities[productId]! - 1;
      totalPrice();
      update(['cart-items']);
    }
  }

  void totalPrice() {
    double total = 0.0;
    for (var item in cart) {
      total += item.price * (productQuantities[item.id] ?? 1);
    }
    price.value = total;
  }

  void deleteProduct(int index) {
    cart.removeAt(index);
    totalPrice();
    update(['cart-items']);
    update(['products']);
  }


}
