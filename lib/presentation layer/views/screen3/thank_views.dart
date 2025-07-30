import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/thank_view_body.dart';

class ThankViews extends StatelessWidget {
  const ThankViews({super.key});

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
      ),
      body: ThankViewBody(),
    );
  }
}
