import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_app/core/utils/api_payment_service.dart';
import 'package:food_app/core/utils/apy_keys.dart';
import 'package:food_app/feature/payment/data/model/ephmeral_model/ephmeral_model.dart';
import 'package:food_app/feature/payment/data/model/init_ephemeral_input_model.dart';
import 'package:food_app/feature/payment/data/model/input_model.dart';
import 'package:food_app/feature/payment/data/model/payment_model/payment_intentsheet.dart';

class StripeService {
  final ApiPaymentService apiPaymentService = ApiPaymentService();
  Future<PaymentIntentSheet> createPaymentIntent(
    InputPaymentIntentModel input,
  ) async {
    var response = await apiPaymentService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: input.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      token: secretKey,
    );
    var inputModel = PaymentIntentSheet.fromJson(response.data);
    return inputModel;
  }

  Future<EphemeralModel> createEphemeralMethod({
    required String customerId,
  }) async {
    var response = await apiPaymentService.post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      body: {'customer': customerId},
      contentType: Headers.formUrlEncodedContentType,
      token: secretKey,
      headers: {
        'Authorization': "Bearer $secretKey",
        'Stripe-Version': '2025-04-30.basil',
      },
    );
    var ephemeralModel = EphemeralModel.fromJson(response.data);
    return ephemeralModel;
  }

  Future initPaymentSheet(InitEphemeralInputModel initInput) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        customerEphemeralKeySecret: initInput.customerEphemeralKeySecret,
        merchantDisplayName: 'Food Restaurant',
        paymentIntentClientSecret: initInput.paymentIntentClientSecret,
        customerId: initInput.customerId,
      ),
    );
  }

  Future displayPresentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(InputPaymentIntentModel input) async {
    var paymentModel = await createPaymentIntent(input);

    var ephemeralModel = await createEphemeralMethod(
      customerId: input.customerId,
    );
    InitEphemeralInputModel initEphemeralModel = InitEphemeralInputModel(
      customerEphemeralKeySecret: ephemeralModel.secret!,
      paymentIntentClientSecret: paymentModel.clientSecret!,
      customerId: input.customerId,
    );
    await initPaymentSheet(initEphemeralModel);
    await displayPresentPaymentSheet();
  }
}
