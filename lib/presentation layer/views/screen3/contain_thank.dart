import 'package:flutter/material.dart';
import 'package:stripe_payment/core/utils/style.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/order_info.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/con_contain_card.dart';

class ContainThank extends StatelessWidget {
  const ContainThank({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 670,
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 224, 222, 222),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              'Thank you!',
              style: Styles.style25,
            ),
            Text('Your transaction was successful',
                style: Styles.style18
                    .copyWith(color: Colors.black.withOpacity(.72))),
            const SizedBox(
              height: 40,
            ),
            const OrderInfo1(
              text: 'Date',
              value: '01/24/2023',
            ),
            const SizedBox(
              height: 16,
            ),
            const OrderInfo1(
              text: 'Time',
              value: '10:15 AM',
            ),
            const SizedBox(
              height: 16,
            ),
            const OrderInfo1(
              text: 'To',
              value: 'Sam Louis',
            ),
            const SizedBox(
              height: 16,
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
          const  ConContainCard()
          ],
        ),
      ),
    );
  }
}
