import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

   const ProductModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  @override
  List<Object?> get props => [products, total, skip, limit];

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel (
      products: (json['products'] as List<dynamic>)
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int,
      skip: json['skip'] as int,
      limit: json['limit'] as int,
    );
  }

  Map<String, dynamic> toJson(ProductModel instance) {
    return <String, dynamic> {
          'products': instance.products,
          'total': instance.total,
          'skip': instance.skip,
          'limit': instance.limit,
        };
  }
}


class Product extends Equatable {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    price,
    discountPercentage,
    rating,
    stock,
    brand,
    category,
    thumbnail,
    images,
  ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    price: (json['price'] as num).toDouble(),
    discountPercentage: (json['discountPercentage'] as num).toDouble(),
    rating: (json['rating'] as num).toDouble(),
    stock: json['stock'] as int,
    brand: json['brand'] as String,
    category: json['category'] as String,
    thumbnail: json['thumbnail'] as String,
    images:
    (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  );
  }

  Map<String, dynamic> toJson(Product instance) {
    return <String, dynamic>{
    'id': instance.id,
    'title': instance.title,
    'description': instance.description,
    'price': instance.price,
    'discountPercentage': instance.discountPercentage,
    'rating': instance.rating,
    'stock': instance.stock,
    'brand': instance.brand,
    'category': instance.category,
    'thumbnail': instance.thumbnail,
    'images': instance.images,
  };
  }
}
