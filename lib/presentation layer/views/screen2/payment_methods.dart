import 'package:flutter/material.dart';
import 'package:stripe_payment/presentation%20layer/views/screen2/payment_item.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  List<String> item = [
    'assets/images/card.svg',
    'assets/images/pay.svg',
    'assets/images/paypal.svg'
  ];
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: item.length,
          itemBuilder: (context, indx) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    active = indx;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child:
                      PaymentItem(Isactive: active == indx, image: item[indx]),
                ));
          }),
    );
  }
}
