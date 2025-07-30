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
        const Spacer(),
        Text(
          r'$' '$value',
          style: Styles.style18,
        )
      ],
    );
  }
}
 class OrderInfo1 extends StatelessWidget {
  const OrderInfo1({super.key, required this.text, required this.value});
  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          r'$' '$value',
          style: Styles.stylesemibold18,
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
        const Spacer(),
        Text(
          r'$' '$value',
          style: Styles.style25,
        )
      ],
    );
  }
}
