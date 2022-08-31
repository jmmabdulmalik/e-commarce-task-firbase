import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../model/api_model.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit() : super(AddProductInitial());
  List<Products> product = [];
  addProducts({required Products items}) {
    product.add(items);

    emit(AddProductLoaded(item: product));
  }
}
