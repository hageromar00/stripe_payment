import 'package:flutter/material.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/custom_button.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/order_info.dart';

class MyCardBody extends StatelessWidget {
  const MyCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/group1.png',
            // width: 200,
            // height: 400,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const OrderInfo(
          text: 'Order Subtota',
          value: '42.97',
        ),
        const SizedBox(
          height: 3,
        ),
        const OrderInfo(
          text: 'Discount',
          value: '0',
        ),
        const SizedBox(
          height: 3,
        ),
        const OrderInfo(
          text: 'Shipping',
          value: '8',
        ),
        const Divider(
          thickness: 2,
          indent: 20,
          endIndent: 20,
          height: 20,
          color: Color(0xffC7C7C7),
        ),
        const SizedBox(
          height: 3,
        ),
        const TotalOrder(text: 'Total', value: '50.97'),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          text: 'Complete Payment',
          onPress: () {},
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
