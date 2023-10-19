import 'dart:convert';

import 'package:ecommerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  Future<List<ProductModel>> getProduct(id) async {
    final response = await http.get(
        Uri.parse('https://api.escuelajs.co/api/v1/categories/$id/products'));
    List<dynamic> jsonData = jsonDecode(response.body);
    List<ProductModel> products =
        jsonData.map((item) => ProductModel.fromJson(item)).toList();
    return products;
  }
}
