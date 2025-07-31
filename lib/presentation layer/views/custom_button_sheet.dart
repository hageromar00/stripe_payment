import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stripe_payment/data%20layer/models/payment_input_model.dart';
import 'package:stripe_payment/presentation%20layer/view_model/payment/payment_cubit.dart';
import 'package:stripe_payment/presentation%20layer/views/screen1/custom_button.dart';
import 'package:stripe_payment/presentation%20layer/views/screen3/thank_views.dart';

class CustomButtonSheet extends StatelessWidget {
  const CustomButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return ThankViews();
          }));
        } else if (state is PaymentFail) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
          print('haasgd');
        }
      },
      builder: (context, state) {
        return CustomButton(
          isload: state is PaymentLoad ? true : false,
          text: 'PAY',
          onPress: () {
            PaymentIntentInputModel model = PaymentIntentInputModel(
              amount: 100,
              currrncy: 'USD',
              customerID: 'cus_SmWmUQdkKwkAqp',
            );
            BlocProvider.of<PaymentCubit>(context).givePayment(model);
            // var transcationData = getTransctionData();
            // excutepaypal(context, transcationData);
          },
        );
      },
    );
  }
}
