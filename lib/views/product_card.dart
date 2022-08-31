import 'package:e_commarce_app/controlers/cubits/index_cubit.dart';
import 'package:e_commarce_app/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controlers/cubits/product_add_cubits/add_product_cubit.dart';
import 'add_tocart_screen.dart';
import 'invoice_screen.dart';

class ProductCard extends StatefulWidget {
  final Products model;
  const ProductCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int total = 0;

  List<Products> product = [];

  @override
  void initState() {
    total = widget.model.price;
    print(total);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 400,
      child: InkWell(
        onTap: () {},
        child: Card(
          child: Column(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(widget.model.id.toString()))),
                  Expanded(
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(widget.model.images[0]),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(widget.model.title.toString()),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "\$ ${widget.model.price}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 20, bottom: 20, right: 10, left: 10),
                            height: 30,
                            width: 100,
                            color: Colors.red,
                            child: InkWell(
                              onTap: () {
                                context
                                    .read<AddProductCubit>()
                                    .addProducts(items: widget.model);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        duration: Duration(microseconds: 60),
                                        content: Text('Product Added')));
                              },
                              child: const Center(
                                child: Text(
                                  'Add To Cart',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
