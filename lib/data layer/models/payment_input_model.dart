class PaymentIntendInputModel {
  final String currency;
  final double amount;
  final String customerId;

  PaymentIntendInputModel(
      {required this.currency, required this.amount, required this.customerId});
  toJson() {
    return {
      "amount":(amount*100).toInt().toString(),
      "currency":currency,
      "customer":customerId
    };
  }
}
