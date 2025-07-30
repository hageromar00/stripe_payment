import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        30,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 2),
          child: Container(
            width: 3,
            height: 1,
            color: Color(0xffB8B8B8),
          ),
        ),
      ),
    );
  }
}
