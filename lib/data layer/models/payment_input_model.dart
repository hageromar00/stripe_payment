// class PaymentIntendInputModel {
//   final String currency;
//   final String amount;
//   final String customerId;

//   PaymentIntendInputModel(
//       {required this.currency, required this.amount, required this.customerId});
//   toJson() {
//     return {
//       'amount':amount,
//       // 'amount': (amount * 100).toInt().toString(),
//       'currency':currency,
//       'customer':customerId
//     };
//   }
// }
class PaymentIntentInputModel {
  final double amount;
  final String currrncy;
  final String customerID;
  PaymentIntentInputModel({required this.amount, required this.currrncy,required this.customerID});
  toJson() {
    return {
      // 'amount':'${amount}00',
      'amount': (amount * 100).toInt().toString(),
      'currency': currrncy,
      'customer':customerID
    };
  }
}