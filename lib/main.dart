import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stripe_payment/core/utils/api_key.dart';
import 'package:stripe_payment/presentation%20layer/views/home_page.dart';

void main() {
  Stripe.publishableKey = ApiKey.publish;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     home: HomePage(),
    );
  }
}
