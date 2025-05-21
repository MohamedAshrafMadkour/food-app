import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_app/feature/payment/data/model/input_model.dart';
import 'package:food_app/feature/payment/data/repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitial());
  final PaymentRepo paymentRepo;
  Future makePaymentCubitMethod({
    required InputPaymentIntentModel inputModel,
  }) async {
    emit(PaymentLoading());
    var data = await paymentRepo.makePayment(inputModel: inputModel);
    data.fold(
      (failure) => emit(PaymentFailure(error: failure.errorMessage.toString())),
      (success) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    debugPrint('change=$change');
    super.onChange(change);
  }
}
