class InitEphemeralInputModel {
  final String customerEphemeralKeySecret;
  final String paymentIntentClientSecret;
  final String customerId;

  InitEphemeralInputModel({
    required this.customerEphemeralKeySecret,
    required this.paymentIntentClientSecret,
    required this.customerId,
  });
}
