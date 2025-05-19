import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';

import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';

abstract class PopUpRepo {
  Future<Either<Failure, List<TastyApiModel>>> getMeals({
    required String meals,
  });
}
