import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key, required this.formKKey,required this.auto});
  final GlobalKey<FormState> formKKey;
  final AutovalidateMode auto;

  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
          isHolderNameVisible: true,
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView:
              isCvvFocused, //true when you want to show cvv(back) view
          onCreditCardWidgetChange: (CreditCardBrand
              brand) {}, // Callback for anytime credit card brand is changed
        ),
        CreditCardForm(
          formKey: widget.formKKey,
          obscureCvv: true,
          obscureNumber: true,
          cardNumber: cardNumber,
          cvvCode: cvvCode,
          isHolderNameVisible: true,
          isCardNumberVisible: true,
          isExpiryDateVisible: true,
          cardHolderName: cardHolderName,
          expiryDate: expiryDate,
          onCreditCardModelChange: (creditCardModel) {
            cardNumber = creditCardModel.cardNumber;
            expiryDate = creditCardModel.expiryDate;
            cardHolderName = creditCardModel.cardHolderName;
            cvvCode = creditCardModel.cvvCode;
            isCvvFocused = creditCardModel.isCvvFocused;
            setState(() {});
          },
        ),
      ],
    );
  }
}
