import 'package:e_commarce_app/controlers/cubits/delate_cubit.dart';
import 'package:e_commarce_app/controlers/cubits/index_cubit.dart';
import 'package:e_commarce_app/controlers/cubits/product_cubit.dart';
import 'package:e_commarce_app/views/product_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controlers/cubits/product_add_cubits/add_product_cubit.dart';
import 'controlers/cubits/status_cubit.dart';
import 'controlers/firebase_data/checkout_cubit.dart';
import 'controlers/firebase_data/fetch_data_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchDataCubit(),
        ),
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
        BlocProvider(create: (context) => IndexCubit(0)),
        BlocProvider(create: (context) => DelateCubit(false)),
        BlocProvider(create: (context) => StatusCubit(false)),
        BlocProvider(create: (context) => CheckoutCubit()),
      ],
      child: MaterialApp(
        home: ProductScreen(),
      ),
    );
  }
}
