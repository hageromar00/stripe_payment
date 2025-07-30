import 'package:flutter/material.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/contain_thank.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/dash_line.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ContainThank(),
        Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .19,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .19,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            )),
        Positioned(
          left: 30,
          right: 30,
          bottom: MediaQuery.sizeOf(context).height * .19 + 15,
          child: DashLine(),
        ),
      ],
    );
  }
}
