import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../model/firebase_model.dart';
part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  Future addData(
      {required List<Product> model,
      required num price,
      required num discount,
      required num netTotal}) async {
    try {
      final FirebaseFirestore firebase = FirebaseFirestore.instance;
      String id = firebase.collection('products').doc().id;
      await firebase.collection("products").doc(id).set({
        'id': id,
        'totalPrice': price,
        'discount': discount,
        'netTotal': netTotal,
        'status': false,
        'Product': List<dynamic>.from(
          model.map((e) => e.toMap()),
        ),
      });
      emit(CheckoutLoaded());
    } on FirebaseException catch (e) {
      emit(CheckoutError(Error: e.message.toString()));
    }
  }
}
