import 'package:dartz/dartz.dart';
import 'package:food_app/core/error/failure.dart';
import 'package:food_app/core/utils/api_service.dart';
import 'package:food_app/feature/pop_up/data/models/tasty_api_model/tasty_api_model.dart';
import 'package:food_app/feature/pop_up/data/repo/pop_up_repo.dart';

class PopUpRepoImpl extends PopUpRepo {
  final ApiService apiService;

  PopUpRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<TastyApiModel>>> getMeals({
    required String meals,
  }) async {
    try {
      var response = await apiService.getMeal(
        endPoints: 'list?from=0&size=10&q=$meals',
      );
      List<TastyApiModel> meal = [];
      for (var item in response['results']) {
        if (item['compilations'] != null && item['compilations'] is List) {
          for (var comp in item['compilations']) {
            meal.add(TastyApiModel.fromJson(comp));
          }
        }
      }
      return right(meal);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}

//https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata
