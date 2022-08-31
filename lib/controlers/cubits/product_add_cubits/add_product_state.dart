part of 'add_product_cubit.dart';

abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class AddProductLoaded extends AddProductState {
  List<Products> item;
  AddProductLoaded({required this.item});
}
