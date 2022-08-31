import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusCubit extends Cubit<bool> {
  StatusCubit(super.initialState);
  changeStatus({required String id, required bool status}) {
    FirebaseFirestore.instance.collection('products').doc(id).update({
      'status': !status,
    });
  }
}
