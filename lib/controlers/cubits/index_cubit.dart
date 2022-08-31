import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class IndexCubit extends Cubit<int> {
  IndexCubit(super.initialState);

  getindex({required index}) {
    emit(index);
  }
}
