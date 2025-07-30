import 'package:flutter/material.dart';

class DashLine extends StatelessWidget {
  const DashLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        40,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Container(
              width: 3,
              height: 1,
              color: const Color(0xffB8B8B8),
            ),
          ),
        ),
      ),
    );
  }
}
