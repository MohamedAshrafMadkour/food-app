import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/feature/payment/data/model/input_model.dart';

abstract class PaymentRepo {
  Future<Either<ServerFailure, void>> makePayment({
    required InputPaymentIntentModel inputModel,
  });
}
