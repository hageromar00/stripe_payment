import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stripe_payment/core/utils/style.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/my_card_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: SvgPicture.asset(
            'assets/images/arrow1.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        title: Text(
          'My Card',
          style: Styles.style25,
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: MyCardBody(),
      ),
    );
  }
}
