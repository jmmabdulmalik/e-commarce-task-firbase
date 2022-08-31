import 'package:e_commarce_app/model/api_model.dart';
import 'package:e_commarce_app/model/firebase_model.dart';
import 'package:flutter/material.dart';
import '../controlers/firebase_data/checkout_cubit.dart';
import '../controlers/firebase_model_controler.dart';
import 'data/custom_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_screen.dart';

class InvoiceScreen extends StatefulWidget {
  final List<Products> model;
  final int index;

  InvoiceScreen({
    Key? key,
    required this.model,
    required this.index,
  }) : super(key: key);

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  double totalPrice = 0;
  double netPrice = 0;

  @override
  void initState() {
    for (var product in widget.model) {
      totalPrice += product.price * product.quantity;
      netPrice += product.price * product.quantity - product.discountPercentage;
    }

    print(netPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BlocListener<CheckoutCubit, CheckoutState>(
          listener: (context, state) {
            if (state is CheckoutError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.Error)));
            } else if (state is CheckoutLoaded) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const OrderScreen();
              }));
            }
          },
          child: InkWell(
            onTap: () {
              FirebaseController().dataToFirebaseModel(
                products: widget.model,
              );
              final List<Product> product =
                  FirebaseController().dataToFirebaseModel(
                products: widget.model,
              );
              context.read<CheckoutCubit>().addData(
                  model: product,
                  price: totalPrice,
                  discount: widget.model[widget.index].discountPercentage,
                  netTotal: netPrice);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'CheckOut',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: const Text('Invoice Screen'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: CustomRow(
                text4: 'Total Price',
                text1: 'Brand',
                text2: 'Price',
                text3: 'Quantity',
              ),
            ),
            SizedBox(
              height: 300,
              width: 300,
              child: Card(
                child: ListView.builder(
                  itemCount: widget.model.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 0),
                        child: Column(
                          children: [
                            Expanded(
                                child: CustomRow(
                              text1: widget.model[index].title,
                              text2: "\$ ${widget.model[index].price}",
                              text3: widget.model[index].quantity.toString(),
                              text4:
                                  "\$ ${widget.model[index].price * widget.model[index].quantity}",
                            )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Total Bill',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "\$ $totalPrice",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 4,
                    child: Text(
                      'Discount',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${widget.model[widget.index].discountPercentage} %",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  const Expanded(
                    flex: 3,
                    child: Text(
                      'Net Price',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "\$${netPrice}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
