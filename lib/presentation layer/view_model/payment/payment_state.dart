part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}

class PaymentLoad extends PaymentState {}

class PaymentSuccess extends PaymentState {}

class PaymentFail extends PaymentState {
  final String errMessage;

  PaymentFail({required this.errMessage});
}
