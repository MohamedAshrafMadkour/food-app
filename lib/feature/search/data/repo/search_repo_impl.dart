import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/core/utils/api_service.dart';
import 'package:food_app/feature/search/data/model/meals_food.dart';
import 'package:food_app/feature/search/data/repo/search_repo.dart';

class SearchRepoImpl extends SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<MealsFood>>> getFoodType({
    required String type,
  }) async {
    try {
      var response = await apiService.getFoodTypeServiceMethod(
        endPoint: '1/search.php?s=$type',
      );
      List<MealsFood> meal = [];
      for (var item in response['meals']) {
        meal.add(MealsFood.fromJson(item));
      }
      return right(meal);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MealsFood>>> getCountryFood({
    required String country,
  }) async {
    try {
      var response = await apiService.getFoodTypeServiceMethod(
        endPoint: '1/filter.php?a=$country',
      );
      List<MealsFood> meal = [];
      for (var item in response['meals']) {
        meal.add(MealsFood.fromJson(item));
      }
      return right(meal);
    } catch (e) {
      if (e.toString() ==
          'type Null is not a subtype of type Iterable<dynamic>') {
        return left(ServerFailure('no meals your search'));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
