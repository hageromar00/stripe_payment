import 'package:flutter/material.dart';
import 'package:stripe_payment/core/utils/style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPress});
  final String text;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 350,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: Styles.style22,
        ),
      ),
    );
  }
}
