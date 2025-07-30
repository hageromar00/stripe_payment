import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stripe_payment/core/utils/style.dart';
import 'package:stripe_payment/presentation%20layer/views/screen2/credit_card_body.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: SvgPicture.asset(
              'assets/images/arrow1.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        title: Text(
          'Payment Details',
          style: Styles.style25,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CreditCardBody(),
      ),
    );
  }
}
