import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/core/error/fail.dart';
import 'package:stripe_payment/core/utils/stripe_service.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';
import 'package:stripe_payment/domain%20layer/check_repo.dart';

class CheckRepoImpl extends CheckRepo {
  final StripeService stripe = StripeService();
  @override
  Future<Either<Failure, void>> makepay(
      {required PaymentIntentInputModel payment}) async {
    try {
      await stripe.MakePayment(payment);
      return right(null);
    } on StripeException catch (e) {
      return left(
          ServerFail(error: e.error.message ?? 'oops,there is an error,here'));
    } catch (e) {
      return left(ServerFail(error: e.toString()));
    }
  }
}
