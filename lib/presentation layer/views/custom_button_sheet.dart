import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:stripe_payment/core/utils/api_key.dart';
import 'package:stripe_payment/data%20layer/models/amount_model/amount_model.dart';
import 'package:stripe_payment/data%20layer/models/amount_model/details.dart';
import 'package:stripe_payment/data%20layer/models/item_list_model/item.dart';
import 'package:stripe_payment/data%20layer/models/item_list_model/item_list_model.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';
import 'package:stripe_payment/presentation%20layer/view_model/payment/payment_cubit.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/custom_button.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/my_card_body.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/thank_views.dart';

class CustomButtonSheet extends StatelessWidget {
  const CustomButtonSheet({super.key, required this.ispaypal});
  final bool ispaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ThankViews();
          }));
        } else if (state is PaymentFail) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
          // print('haasgd');
        }
      },
      builder: (context, state) {
        return CustomButton(
          isload: state is PaymentLoad ? true : false,
          text: 'PAY',
          onPress: () {
            if (ispaypal) {
              var transcationData = getTransctionData();
              excutepaypal(context, transcationData);
            } else {
              PaymentIntentInputModel model = PaymentIntentInputModel(
                amount: 50.97,
                currrncy: 'USD',
                customerID: 'cus_SmWmUQdkKwkAqp',
              );
              BlocProvider.of<PaymentCubit>(context).givePayment(model);
            }
            // PaymentIntentInputModel model = PaymentIntentInputModel(
            //   amount: 100,
            //   currrncy: 'USD',
            //   customerID: 'cus_SmWmUQdkKwkAqp',
            // );
            // BlocProvider.of<PaymentCubit>(context).givePayment(model);
            // var transcationData = getTransctionData();
            // excutepaypal(context, transcationData);
          },
        );
      },
    );
  }

  void excutepaypal(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transcationData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKey.clientPaypal,
        secretKey: ApiKey.SecretPayPal,
        transactions: [
          {
            "amount": transcationData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transcationData.itemList.toJson()
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return ThankViews();
          }), (route) {
            if (route.settings.name == '/') {
              return true;
            } else {
              return false;
            }
          });
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) {
          //     return const ThankViews();
          //   }),
          // );
        },
        onError: (error) {
          log("onError: $error");
          // Navigator.pop(context);
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context) {
            return MyCardBody();
          }), (route) {
            return false;
          });
                ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(error)));
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransctionData() {
    var amount = AmountModel(
      currency: "USD",
      details: Details(
        subtotal: "50.97",
        shipping: "0",
        shippingDiscount: 0,
      ),
      total: "50.97",
    );
    List<Item> orders = [
      Item(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      Item(name: "Pineapple", quantity: 1, price: "10.97", currency: "USD"),
    ];
    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
