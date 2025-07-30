import 'package:flutter/material.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/check.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/contain_thank.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/dash_line.dart';

class ThankViewBody extends StatelessWidget {
  const ThankViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ContainThank(),
          const Positioned(
            top: 5,
            // bottom: -50,
            right: 0,
            left: 0,
            child: ContainThank(),
          ),
          Positioned(
              left: -20,
              bottom: MediaQuery.sizeOf(context).height * .21,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
              right: -20,
              bottom: MediaQuery.sizeOf(context).height * .21,
              child: const CircleAvatar(
                backgroundColor: Colors.white,
              )),
          Positioned(
            left: 30,
            right: 30,
            bottom: MediaQuery.sizeOf(context).height * .21 + 18,
            child: const DashLine(),
          ),
          const Positioned(top: -30, left: 0, right: 0, child: Check()),
        ],
      ),
    );
  }
}
