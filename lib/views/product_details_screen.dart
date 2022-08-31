import 'package:flutter/material.dart';

import '../model/firebase_model.dart';
import 'data/custom_row.dart';

class ProductDetails extends StatefulWidget {
  List<Product> product;
  int totalPrice;
  int netTotal;
  String id;
  int index;
  ProductDetails({
    Key? key,
    required this.product,
    required this.id,
    required this.index,
    required this.totalPrice,
    required this.netTotal,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    print(widget.product.length);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 550,
          width: 400,
          child: Column(
            children: [
              const Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text("User Product Details"))),
              Expanded(
                child: CustomRow(
                  text1: 'Product Name',
                  text2: 'Quantity',
                  text3: 'Price',
                  text4: 'stock',
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                    itemCount: widget.product.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                          height: 50,
                          width: 500,
                          child: CustomRow(
                            text1: widget.product[index].title,
                            text2: widget.product[index].quantity.toString(),
                            text3: widget.product[index].price.toString(),
                            text4: widget.product[index].stock.toString(),
                          ));
                    }),
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Total Price',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                  Expanded(
                      child: Text(
                    "\$ ${widget.totalPrice}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text(
                        'Net Price',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      )),
                  Expanded(
                    child: Text(
                      "\$ ${widget.netTotal.toString()}",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
