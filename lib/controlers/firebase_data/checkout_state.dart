part of 'checkout_cubit.dart';

abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {}

class CheckoutError extends CheckoutState {
  String Error;
  CheckoutError({required this.Error});
}
