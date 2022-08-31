import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/api_model.dart';
import '../../model/firebase_model.dart';
part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());
  Future getData() async {
    List<OrderModel> product = [];
    emit(FetchDataLoading());
    FirebaseFirestore.instance
        .collection("products")
        .snapshots()
        .listen((event) {
      product.clear();
      for (var p in event.docs) {
        product.add(orderModelFromMap(jsonEncode(p.data())));
      }
      emit(FetchDataLoaded(
        order: product,
      ));
    });
  }
}
