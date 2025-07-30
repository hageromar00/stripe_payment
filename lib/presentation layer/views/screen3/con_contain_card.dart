import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stripe_payment/core/utils/style.dart';

class ConContainCard extends StatelessWidget {
  const ConContainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 75,
        decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/logo.svg'),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Credit Card',
                      style: Styles.style18,
                    ),
                    Text(
                      'Mastercard **78',
                      style: Styles.style18.copyWith(
                        color: Colors.black.withOpacity(.588),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
