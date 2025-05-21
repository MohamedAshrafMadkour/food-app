import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:food_app/core/constant/box.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/core/helper/snack_bar.dart';
import 'package:food_app/core/utils/apy_keys.dart';
import 'package:food_app/core/utils/navigation.dart';
import 'package:food_app/feature/home/data/models/cart_model.dart';
import 'package:food_app/feature/payment/data/model/amount_model/amount_model.dart';
import 'package:food_app/feature/payment/data/model/amount_model/details.dart';
import 'package:food_app/feature/payment/data/model/input_model.dart';
import 'package:food_app/feature/payment/data/model/orders_list/item.dart';
import 'package:food_app/feature/payment/data/model/orders_list/orders_list.dart';
import 'package:food_app/feature/payment/presentation/manager/cubit/payment_cubit.dart';
import 'package:food_app/feature/payment/presentation/view/widget/custom_elevated_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

class CustomConsumerButton extends StatelessWidget {
  const CustomConsumerButton({
    super.key,
    required this.isPaypal,
    required this.totalPrice,
    required this.count,
  });
  final bool isPaypal;
  final double totalPrice;
  final int count;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          var error = ServerFailure(state.error);
          return snakeBarShow(context, error.toString());
        }
        if (state is PaymentSuccess) {
          GoRouter.of(context).push(RouterNavigation.kThanksView);
        }
      },
      builder: (context, state) {
        return CustomElevatedButton(
          onPressed: () {
            if (isPaypal) {
              var transaction = getProductData();
              executePaypalPayment(context, transaction);
            } else {
              executeStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,
          title: 'Continue',
        );
      },
    );
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, OrdersList itemList}) product,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: paypalClientId,
              secretKey: paypalSecretKey,
              transactions: [
                {
                  "amount": getProductData().amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": getProductData().itemList.toJson(),
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");

                GoRouter.of(
                  context,
                ).pushReplacement(RouterNavigation.kThanksView);
              },
              onError: (error) {
                log("onError: $error");
                var failure = ServerFailure(error.toString());
                snakeBarShow(context, failure.toString());
                GoRouter.of(context).pop();
              },
              onCancel: () {
                print('cancelled:');
                Navigator.pop(context);
              },
            ),
      ),
    );
  }

  ({AmountModel amount, OrdersList itemList}) getProductData() {
    var amount = AmountModel(
      total: "$totalPrice",
      currency: 'USD',
      details: Details(
        shipping: 0,
        shippingDiscount: 0,
        subtotal: '$totalPrice',
      ),
    );

    List<Product> orders =
        Hive.box<CartModel>(kCartBox).values
            .map(
              (item) => Product(
                currency: 'USD',
                name: item.name,
                price: item.price,
                quantity: 1,
              ),
            )
            .toList();

    var itemList = OrdersList(items: orders);

    return (amount: amount, itemList: itemList);
  }

  void executeStripePayment(BuildContext context) {
    InputPaymentIntentModel input = InputPaymentIntentModel(
      customerId: kId,
      amount: '$totalPrice',
      currency: 'USD',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePaymentCubitMethod(inputModel: input);
  }
}
