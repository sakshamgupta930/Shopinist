import 'dart:convert';

import 'package:ecommerce_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<CategoryModel>> getCategory() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
    List<dynamic> jsonData = jsonDecode(response.body);
    List<CategoryModel> categories =
        jsonData.map((item) => CategoryModel.fromJson(item)).toList();
    return categories;
  }

  
}
