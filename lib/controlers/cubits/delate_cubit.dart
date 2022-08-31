import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DelateCubit extends Cubit<bool> {
  DelateCubit(super.initialState);
  delateCart({required String id}) {
    FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .delete()
        .then((value) => debugPrint('success'));
  }
}
