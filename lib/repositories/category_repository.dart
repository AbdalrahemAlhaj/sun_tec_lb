import 'dart:convert';

import 'package:dio/dio.dart';
import '../models/category.dart';

import '../api/api_client.dart';

class CategoryRepository{
  final ApiClient _client = ApiClient();
  List<Category> categories = [];

  Future<List<Category>> getAllCategories() async {

    final Response response = await _client.getCategories();
    if (response.statusCode == 200 && response.data != null) {
      categories = List<Category>.from(json.decode(response.data).map((category) => Category.fromJson(category)));
      return categories;
    }
    else {
      return categories;
    }
  }

}