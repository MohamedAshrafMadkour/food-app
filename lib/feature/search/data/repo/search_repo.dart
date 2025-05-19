import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/feature/search/data/model/meals_food.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<MealsFood>>> getFoodType({required String type});
  Future<Either<Failure, List<MealsFood>>> getCountryFood({
    required String country,
  });
}
