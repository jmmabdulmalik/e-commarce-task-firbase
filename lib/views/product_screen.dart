import 'package:e_commarce_app/controlers/cubits/product_cubit.dart';
import 'package:e_commarce_app/model/api_model.dart';
import 'package:e_commarce_app/views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controlers/model_cotroler.dart';
import 'add_tocart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductCubit>().getApiData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const AddToCartScreen();
                }));
              },
              icon: const Icon(Icons.add_shopping_cart))
        ],
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            var model = ModelController.model;
            print('=========> length ${model.total}');
            return ListView.builder(
                itemCount: model.products.length,
                itemBuilder: (context, index) {
                  index = index;
                  Products product = model.products[index];
                  return ProductCard(
                    model: product,
                  );
                });
          } else if (state is ProductError) {
            return const Center(
              child: Text('Error'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
