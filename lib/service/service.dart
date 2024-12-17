import 'dart:developer';

import 'package:cart_task/model/cart_model.dart';
import 'package:cart_task/utils/const/api.dart';
import 'package:dio/dio.dart';

class CartService {
  Dio dio = Dio();

  Future<List<CartModel>?> fetchProduct() async {
    String path = Apis().baseUrl;
    try {
      Response response = await dio.get(
        path,
        options: Options(validateStatus: (status) => status! < 599),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        final res = data.map((e) => CartModel.fromJson(e)).toList();
        log(res.toString());
        return res;
      }
    } catch (e) {
      log(e.toString(), name: 'service error');
    }
    return null;
  }
}
