import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:stripe_payment/core/utils/api_key.dart';
import 'package:stripe_payment/data%20layer/models/amount_model/amount_model.dart';
import 'package:stripe_payment/data%20layer/models/amount_model/details.dart';
import 'package:stripe_payment/data%20layer/models/item_list_model/item.dart';
import 'package:stripe_payment/data%20layer/models/item_list_model/item_list_model.dart';
import 'package:stripe_payment/presentation%20layer/views/custom_button_sheet.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/custom_button.dart';
import 'package:stripe_payment/presentation%20layer/views/screen2/payment_methods.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/thank_views.dart';

class PaySheet extends StatefulWidget {
  const PaySheet({super.key});

  @override
  State<PaySheet> createState() => _PaySheetState();
}

class _PaySheetState extends State<PaySheet> {
  bool isPaypal = false;
  updatePayment({required int indx}) {
    if (indx == 0) {
      isPaypal = false;
    }
    else{
      isPaypal=true;
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
           PaymentMethods(updatemethod:updatePayment,),
          const SizedBox(
            height: 10,
          ),
          CustomButtonSheet(
            ispaypal: isPaypal,
          ),
          // CustomButton(
          //   text: 'PAY',
          //   onPress: () {
          //     var transcationData = getTransctionData();
          //     excutepaypal(context, transcationData);
          //   },
          // ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
