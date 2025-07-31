import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:stripe_payment/data%20layer/models/amount_model/amount_model.dart';
import 'package:stripe_payment/data%20layer/models/amount_model/details.dart';
import 'package:stripe_payment/data%20layer/models/item_list_model/item.dart';
import 'package:stripe_payment/data%20layer/models/item_list_model/item_list_model.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/custom_button.dart';
import 'package:stripe_payment/presentation%20layer/views/screen2/payment_methods.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/thank_views.dart';

class PaySheet extends StatelessWidget {
  const PaySheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const PaymentMethods(),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'PAY',
            onPress: () {
              // var transcationData = getTransctionData();
              // excutepaypal(context, transcationData);
            },
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  void excutepaypal(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transcationData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AYZcFJEE93wOCbmzlIm1gpkOzpYQwW6lDMEyOM7C3DLJTu6XeUUqCWvgY1Rxf8ajIgEwSR64M27Yh2JI",
        secretKey:
            "EC5ejoH7Q20wp9fc9CuYJc6W6vTnlD3n7O0BeeK0wmKjKe9h__m8BQYjVCclyAucZ7D58Gr8OE4SLMOp",
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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const ThankViews();
          }));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
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
        subtotal: "100",
        shipping: "0",
        shippingDiscount: 0,
      ),
      total: "100",
    );
    List<Item> orders = [
      Item(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      Item(name: "Pineapple", quantity: 5, price: "12", currency: "USD"),
    ];
    var itemList = ItemListModel(items: orders);
    return (amount: amount, itemList: itemList);
  }
}
