import 'package:dartz/dartz.dart';
import 'package:stripe_payment/core/error/fail.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';

abstract class CheckRepo {
  Future<Either<Failure, void>> makepay(
      {required PaymentIntendInputModel payment});
}


