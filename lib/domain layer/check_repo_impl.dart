import 'package:dartz/dartz.dart';
import 'package:stripe_payment/core/error/fail.dart';
import 'package:stripe_payment/core/utils/stripe_service.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';
import 'package:stripe_payment/domain%20layer/check_repo.dart';

class CheckRepoImpl extends CheckRepo {
  final StripeService stripe = StripeService();
  @override
  Future<Either<Failure, void>> makepay(
      {required PaymentIntendInputModel payment}) async {
    try {
      await stripe.MakePayment(payment);
      return right(null);
    } catch (e) {
      return left(ServerFail(error: e.toString()));
    }
  }
}
