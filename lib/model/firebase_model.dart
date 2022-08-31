// To parse this JSON data, do
//
//     final orderModel = orderModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OrderModel orderModelFromMap(String str) =>
    OrderModel.fromMap(json.decode(str));

String orderModelToMap(OrderModel data) => json.encode(data.toMap());

class OrderModel {
  OrderModel({
    required this.id,
    required this.totalPrice,
    required this.product,
    required this.discount,
    required this.netTotal,
    required this.status,
  });

  String id;
  double totalPrice;
  List<Product> product;
  double discount;
  double netTotal;
  bool status;

  factory OrderModel.fromMap(Map<String, dynamic> json) => OrderModel(
        totalPrice: json["totalPrice"],
        product:
            List<Product>.from(json["Product"].map((x) => Product.fromMap(x))),
        discount: json["discount"].toDouble(),
        netTotal: json["netTotal"].toDouble(),
        status: json["status"],
        id: json['id'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "totalPrice": totalPrice,
        "Product": List<dynamic>.from(product.map((x) => x.toMap())),
        "discount": discount,
        "netTotal": netTotal,
        "status": status,
      };
}

class Product {
  Product({
    required this.thumbnail,
    required this.quantity,
    required this.price,
    required this.title,
    required this.category,
    required this.stock,
  });

  String thumbnail;
  int quantity;
  int price;
  String title;
  String category;
  int stock;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        thumbnail: json["thumbnail"],
        quantity: json["quantity"],
        price: json["price"],
        title: json["title"],
        category: json["category"],
        stock: json["stock"],
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail,
        "quantity": quantity,
        "price": price,
        "title": title,
        "category": category,
        "stock": stock,
      };
}
