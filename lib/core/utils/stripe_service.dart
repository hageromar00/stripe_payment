import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/core/utils/api_key.dart';
import 'package:stripe_payment/core/utils/api_service.dart';
import 'package:stripe_payment/data%20layer/models/ephemeral/ephemeral.dart';
import 'package:stripe_payment/data%20layer/models/pay_init.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';
import 'package:stripe_payment/data%20layer/models/payment_mehods_model/payment_mehods_model.dart';

class StripeService {
  final ApiService apiservice = ApiService();
  Future<PaymentMehodsModel> createPayment(
      PaymentIntendInputModel payment) async {
    var createpayment = await apiservice.post(
        body: payment.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKey.secret,
        conttype: Headers.formUrlEncodedContentType);
    var paymodel = PaymentMehodsModel.fromJson(createpayment.data);
    return paymodel;
  }

  Future<Ephemeral> createEpheKey({required String customid}) async {
    var createpayment = await apiservice.post(
        body: customid,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKey.secret,
        conttype: Headers.formUrlEncodedContentType,
        head: {
          'Authorization': "Bearer ${ApiKey.secret}",
          "Stripe-Version": "2025-06-30.basil"
        });
    var ephemKey = Ephemeral.fromJson(createpayment.data);
    return ephemKey;
  }

  Future initPaymentSheet(PayInit pay) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Flutter Stripe Store Demo',
      paymentIntentClientSecret: pay.secret,
      // Customer keys
      customerEphemeralKeySecret: pay.ephemeralKey,
      customerId: pay.customer,
    ));
  }

  Future DisplayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future MakePayment(PaymentIntendInputModel payment) async {
    var createpayment = await createPayment(payment);
    var createEphKey = await createEpheKey(customid: payment.customerId);
    var pay = PayInit(
      secret: createpayment.clientSecret!,
      customer: createpayment.customer,
      ephemeralKey: createEphKey.secret!,
    );
    await initPaymentSheet(pay);
    await DisplayPaymentSheet();
  }
}
