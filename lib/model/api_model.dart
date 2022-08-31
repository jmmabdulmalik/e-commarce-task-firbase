// To parse this JSON data, do
//
//     final apiDataModel = apiDataModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ApiDataModel apiDataModelFromMap(String str) =>
    ApiDataModel.fromMap(json.decode(str));

String apiDataModelToMap(ApiDataModel data) => json.encode(data.toMap());

class ApiDataModel {
  ApiDataModel({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  List<Products> products;
  int total;
  int skip;
  int limit;

  factory ApiDataModel.fromMap(Map<String, dynamic> json) => ApiDataModel(
        products: List<Products>.from(
            json["products"].map((x) => Products.fromMap(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
      );

  Map<String, dynamic> toMap() => {
        "products": List<dynamic>.from(products.map((x) => x.toMap())),
        "total": total,
        "skip": skip,
        "limit": limit,
      };
}

class Products {
  Products({
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
    required this.quantity,
    required this.totalPrice,
  });

  int id;
  String title;
  String description;
  int price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  int quantity;
  int totalPrice;
  factory Products.fromMap(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        discountPercentage: json["discountPercentage"].toDouble(),
        rating: json["rating"].toDouble(),
        stock: json["stock"],
        brand: json["brand"],
        category: json["category"],
        thumbnail: json["thumbnail"],
        images: List<String>.from(json["images"].map((x) => x)),
        quantity: 1,
        totalPrice: 1,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "brand": brand,
        "category": category,
        "thumbnail": thumbnail,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
