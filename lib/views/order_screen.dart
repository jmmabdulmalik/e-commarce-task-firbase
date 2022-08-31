import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commarce_app/controlers/cubits/delate_cubit.dart';
import 'package:e_commarce_app/views/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controlers/cubits/status_cubit.dart';
import '../controlers/firebase_data/fetch_data_cubit.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context.read<FetchDataCubit>().getData();
    super.initState();
  }

  String id = '';
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<FetchDataCubit, FetchDataState>(
        builder: (context, state) {
          if (state is FetchDataLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchDataLoaded) {
            return ListView.builder(
                itemCount: state.order.length,
                itemBuilder: (context, index) {
                  status = state.order[index].status;
                  id = state.order[index].id;
                  return SizedBox(
                      height: 180,
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ProductDetails(
                              product: state.order[index].product,
                              id: state.order[index].id,
                              index: index,
                              totalPrice: state.order[index].totalPrice.toInt(),
                              netTotal: state.order[index].netTotal.toInt(),
                            );
                          }));
                        },
                        child: Card(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Column(
                            children: [
                              Expanded(
                                  child: Row(
                                children: [
                                  Expanded(
                                      flex: 3,
                                      child: Text(
                                          "Number of Users: ${index + 1}")),
                                  Expanded(
                                    child: BlocBuilder<DelateCubit, bool>(
                                      builder: (context, state) {
                                        return IconButton(
                                          onPressed: () async {
                                            context
                                                .read<DelateCubit>()
                                                .delateCart(id: id);
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                              Expanded(
                                  child: Text(
                                      "User Id : ${state.order[index].id}")),
                              Expanded(
                                  child: Row(
                                children: [
                                  const Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Status',
                                        style: TextStyle(color: Colors.red),
                                      )),
                                  Expanded(
                                      child: InkWell(
                                    onTap: () {
                                      context.read<StatusCubit>().changeStatus(
                                          id: state.order[index].id,
                                          status: state.order[index].status);
                                    },
                                    child: BlocBuilder<StatusCubit, bool>(
                                      builder: (context, state) {
                                        return Icon(status == true
                                            ? Icons.not_interested_rounded
                                            : Icons.check);
                                      },
                                    ),
                                  ))
                                ],
                              )),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 3, child: Text('Total Price')),
                                    Expanded(
                                        child: Text(state
                                            .order[index].totalPrice
                                            .toString()))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    const Expanded(
                                        flex: 3, child: Text('Discount')),
                                    Expanded(
                                        child: Text(state.order[index].discount
                                            .toString()))
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 3, child: Text('net total')),
                                  Expanded(
                                      child: Text(state.order[index].netTotal
                                          .toString()))
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ));
                });
          } else if (state is FetchDataError) {
            return Center(
              child: Text(state.erro.toString()),
            );
          }
          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
