import 'package:flutter/material.dart';

import '../model/api_model.dart';
import '../model/firebase_model.dart';
import 'firebase_data/checkout_cubit.dart';

class FirebaseController extends StatefulWidget {
  const FirebaseController({Key? key}) : super(key: key);

  @override
  State<FirebaseController> createState() => _FirebaseControllerState();

  List<Product> dataToFirebaseModel({
    required List<Products> products,
  }) {
    List<Product> listOfProducts = [];
    for (var data in products) {
      Product product = Product(
          title: data.title,
          category: data.category,
          price: data.price,
          quantity: data.quantity,
          stock: data.stock,
          thumbnail: data.thumbnail);
      Product pr = product;

      listOfProducts.add(pr);
    }

    return listOfProducts;
  }
}

class _FirebaseControllerState extends State<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
