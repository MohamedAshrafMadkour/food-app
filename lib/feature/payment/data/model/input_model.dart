class InputPaymentIntentModel {
  final String amount; // القيمة كـ string بالصيغة العشرية (مثلاً "10.50")
  final String currency;
  final String customerId;

  InputPaymentIntentModel({
    required this.customerId,
    required this.amount,
    required this.currency,
  });

  Map<String, dynamic> toJson() {
    double parsedAmount = double.tryParse(amount) ?? 0.0;

    int amountInCents = (parsedAmount * 100).round();

    return {
      'amount': amountInCents.toString(),
      'currency': currency,
      'customer': customerId,
    };
  }
}
