import 'package:e_commarce_app/model/api_model.dart';
import 'package:e_commarce_app/views/invoice_screen.dart';
import 'package:e_commarce_app/views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controlers/cubits/product_add_cubits/add_product_cubit.dart';
import 'data/custom_cart.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({Key? key}) : super(key: key);

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

int total = 0;
int indx = 0;

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddProductCubit, AddProductState>(
        builder: (context, state) {
      if (state is AddProductLoaded) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart Product'),
            centerTitle: true,
          ),
          bottomNavigationBar: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InvoiceScreen(
                  index: indx,
                  model: state.item,
                );
              }));
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 30, right: 10, left: 10),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 40,
              width: 200,
            ),
          ),
          body: ListView.builder(
              itemCount: state.item.length,
              itemBuilder: (context, index) {
                indx = index;
                return CustomCart(
                  model: state.item[index],
                );
              }),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text('No Data'),
          ),
        );
      }
    });
  }
}
