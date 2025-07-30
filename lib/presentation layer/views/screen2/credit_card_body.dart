import 'package:flutter/material.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/custom_button.dart';
import 'package:stripe_payment/presentation%20layer/views/screen2/custom_credit_card.dart';
import 'package:stripe_payment/presentation%20layer/views/screen2/payment_methods.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/thank_views.dart';

class CreditCardBody extends StatefulWidget {
  CreditCardBody({super.key});

  @override
  State<CreditCardBody> createState() => _CreditCardBodyState();
}

class _CreditCardBodyState extends State<CreditCardBody> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey();
    AutovalidateMode auto = AutovalidateMode.disabled;
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: PaymentMethods()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            auto: auto,
            formKKey: formkey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: CustomButton(
              text: 'PAY',
              onPress: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                     Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThankViews();
                }));
                  
                } else {
                  auto = AutovalidateMode.always;
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ThankViews();
                }));
              },
            ),
          ),
        ),
        // SizedBox(
        //   height: 20,
        // )
      ],
    );
  }
}
