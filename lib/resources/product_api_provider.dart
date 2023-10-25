import 'dart:convert';
import 'dart:io';

import 'package:bloc_api/models/product_model.dart';

class ProductApiProvider{

  static const baseUrl = 'https://dummyjson.com/';
  static const products = 'products';

  Future<ProductModel> fetchProducts() async{
    final Uri uri = Uri.parse("$baseUrl$products");
    final HttpClientRequest request = await HttpClient().getUrl(uri);
    final HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      String responseBody = await response.transform(utf8.decoder).join();
      Map<String, dynamic> responseMap = json.decode(responseBody);
      return ProductModel.fromJson(responseMap);
    } else {
      throw Exception('Failed to load data');
    }
  }


}