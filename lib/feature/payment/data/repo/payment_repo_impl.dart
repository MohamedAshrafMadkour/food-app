import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/core/utils/stripe_service.dart';
import 'package:food_app/feature/payment/data/model/input_model.dart';
import 'package:food_app/feature/payment/data/repo/payment_repo.dart';

class PaymentRepoImpl extends PaymentRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<ServerFailure, void>> makePayment({
    required InputPaymentIntentModel inputModel,
  }) async {
    try {
      await stripeService.makePayment(inputModel);
      return right(null);
    } catch (e) {
      log(e.toString());
      return left(ServerFailure(e.toString()));
    }
  }
}
