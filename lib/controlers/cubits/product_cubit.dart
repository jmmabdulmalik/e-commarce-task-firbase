import 'package:bloc/bloc.dart';
import 'package:e_commarce_app/model/api_model.dart';
import 'package:meta/meta.dart';

import '../api.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  Future getApiData() async {
    emit(ProductLoading());
    print('loading');
    final data = await RepoApi.fetchWorldState();
    print(data);
    if (data == 200) {
      emit(ProductLoaded());
      print('loaded');
    } else {
      emit(ProductError());
    }
  }
}
