import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<FoodResults>>> getMainFood();
}
