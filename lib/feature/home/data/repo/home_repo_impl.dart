import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/core/utils/api_service.dart';
import 'package:food_app/feature/home/data/models/food_results.dart';
import 'package:food_app/feature/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<FoodResults>>> getMainFood() async {
    try {
      var response = await apiService.getMainFood(
        endPoint: 'complexSearch?query=all&addRecipeInformation=true',
      );
      List<FoodResults> mainFood = [];
      for (var item in response['results']) {
        mainFood.add(FoodResults.fromJson(item));
      }
      return right(mainFood);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
