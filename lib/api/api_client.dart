import 'package:dio/dio.dart';

class ApiClient{
  final String baseURL = "https://suntec-lb.com";

  Future<Response> getCategories() async {
    return await Dio().get(baseURL + "/mobile_listcategories.php");
  }

  Future<Response> getProducts(int productCategoryId) async {
    return await Dio().get(baseURL + "/mobile_listitems.php?catid=" + productCategoryId.toString());
  }
}