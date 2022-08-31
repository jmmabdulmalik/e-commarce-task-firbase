part of 'fetch_data_cubit.dart';

@immutable
abstract class FetchDataState {}

class FetchDataInitial extends FetchDataState {}

class FetchDataLoading extends FetchDataState {}

class FetchDataLoaded extends FetchDataState {
  List<OrderModel> order;

  FetchDataLoaded({
    required this.order,
  });
}

class FetchDataError extends FetchDataState {
  String erro;

  FetchDataError({required this.erro});
}
