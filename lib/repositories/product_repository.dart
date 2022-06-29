import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/product.dart';

import '../api/api_client.dart';

class ProductRepository{
  final ApiClient _client = ApiClient();
  List<Product> products = [];

  Future<List<Product>> getAllProducts(int productCategoryId) async {

    final Response response = await _client.getProducts(productCategoryId);
    if (response.statusCode == 200 && response.data != null) {
      products = List<Product>.from(json.decode(response.data).map((product) => Product.fromJson(product)));
      return products;
    }
    else {
      return products;
    }
  }

}