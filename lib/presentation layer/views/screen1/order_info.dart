import 'package:flutter/material.dart';
import 'package:stripe_payment/core/utils/style.dart';

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.text, required this.value});
  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.style18,
        ),
        Spacer(),
        Text(
          r'$' '${value}',
          style: Styles.style18,
        )
      ],
    );
  }
}

class TotalOrder extends StatelessWidget {
  const TotalOrder({super.key, required this.text, required this.value});
  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.style25,
        ),
        Spacer(),
        Text(
          r'$' '${value}',
          style: Styles.style25,
        )
      ],
    );
    ;
  }
}
