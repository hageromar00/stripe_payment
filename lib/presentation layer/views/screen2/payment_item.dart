import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key, required this.Isactive, required this.image});
  final String image;
  final bool Isactive;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 103,
      height: 60,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(1, 2),
              color: Isactive ? const Color(0xFF34A853) : Colors.white,
            ),
          ],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                  color: Isactive ? const Color(0xFF34A853) : Colors.grey,
                  width: 1.4)),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: SvgPicture.asset(image),
          ),
        ),
      ),
    );
  }
}
