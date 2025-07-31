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
      PaymentIntentInputModel payment) async {
    //     var response = await apiservice.post(
    //     body: payment.toJson(),
    //     contenttype: Headers.formUrlEncodedContentType,
    //     url: 'https://api.stripe.com/v1/payment_intents',
    //     token: ApiKey.secretkey);
    // var paymentmodel = PaymentMehodsModel.fromJson(response.data); //parse
    // return paymentmodel;
    var createpayment = await apiservice.post(
        body: payment.toJson(),
        url: 'https://api.stripe.com/v1/payment_intents',
        token: ApiKey.secretkey,
        contenttype: Headers.formUrlEncodedContentType);
    var paymodel = PaymentMehodsModel.fromJson(createpayment.data);
    return paymodel;
  }

  Future<Ephemeral> createEpheKey({required String customerid}) async {
        var response = await apiservice.post(
        body: {'customer': customerid},
        contenttype: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: ApiKey.secretkey,
        head: {
          'Authorization': "Bearer ${ApiKey.secretkey}",
          'Stripe-Version': '2025-06-30.basil'
        });
    var ephmeralkey = Ephemeral.fromJson(response.data); //parse
    return ephmeralkey;
    // var createpayment = await apiservice.post(
    //     body: customid,
    //     url: 'https://api.stripe.com/v1/ephemeral_keys',
    //     token: ApiKey.secretkey,
    //     contenttype: Headers.formUrlEncodedContentType,
    //     header: {
    //       'Authorization': "Bearer ${ApiKey.secretkey}",
    //       "Stripe-Version": "2025-06-30.basil"
    //     });
    // var ephemKey = Ephemeral.fromJson(createpayment.data);
    // return ephemKey;
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

  Future MakePayment(PaymentIntentInputModel payment) async {
    var createpayment = await createPayment(payment);
    var createEphKey = await createEpheKey(customerid: payment.customerID);
    var pay = PayInit(
      secret: createpayment.clientSecret!,
      customer: createpayment.customer,
      ephemeralKey: createEphKey.secret!,
    );
    await initPaymentSheet(pay);
    await DisplayPaymentSheet();
  }
}
