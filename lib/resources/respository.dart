import 'package:bloc_api/resources/product_api_provider.dart';
import '../models/product_model.dart';

class Repository{

  final ProductApiProvider productApiProvider = ProductApiProvider();

  Future<ProductModel> fetchProducts() => productApiProvider.fetchProducts();

}