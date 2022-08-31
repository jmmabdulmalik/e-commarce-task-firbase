import 'package:e_commarce_app/controlers/cubits/index_cubit.dart';
import 'package:e_commarce_app/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controlers/cubits/product_add_cubits/add_product_cubit.dart';

class CustomCart extends StatelessWidget {
  final Products model;

  CustomCart({
    Key? key,
    required this.model,
  }) : super(key: key);

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
                          child: Text(model.id.toString()))),
                  Expanded(
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(model.images[0]),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: ListTile(
                      title: Text(model.title.toString()),
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
                              "\$ ${model.price}",
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Expanded(
                child: BlocBuilder<IndexCubit, int>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                    'total Amount \$ ${model.price * model.quantity}'))),
                        const Spacer(
                          flex: 5,
                        ),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                if (model.quantity >= 1) {
                                  context
                                      .read<IndexCubit>()
                                      .getindex(index: model.quantity++);
                                  model.totalPrice =
                                      model.quantity * model.price;
                                }
                              },
                              child: const Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                        Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(model.quantity.toString()))),
                        Expanded(
                            child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: InkWell(
                              onTap: () {
                                if (model.quantity > 1) {
                                  context
                                      .read<IndexCubit>()
                                      .getindex(index: model.quantity--);
                                  model.totalPrice =
                                      model.quantity * model.price;
                                }
                              },
                              child: const Icon(
                                Icons.remove,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
