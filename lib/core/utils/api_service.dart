import 'package:dio/dio.dart';
import 'package:food_app/core/utils/apy_keys.dart';

class ApiService {
  final Dio dio;
  String baseUrl = 'https://api.spoonacular.com/recipes/';
  Map<String, String> header = {'apiKey': kApiKey};

  ApiService({required this.dio});
  Future<Map<String, dynamic>> getMainFood({required String endPoint}) async {
    var response = await dio.get(
      '$baseUrl$endPoint',
      queryParameters: {'apiKey': kApiKey},
    );
    return response.data;
  }

  final String _baseUrl = 'https://tasty.p.rapidapi.com/recipes/';

  static const headers = {
    'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
    'x-rapidapi-key': tastyApiKey,
  };

  Future<Map<String, dynamic>> getMeal({required String endPoints}) async {
    var response = await dio.get(
      '$_baseUrl$endPoints',
      options: Options(headers: headers),
    );
    print('data=${response.data}');
    return response.data;
  }

  //https://www.themealdb.com/api/json/v1/1/filter.php?a=Egyptian
  String mealBaseUrl = 'https://www.themealdb.com/api/json/v1/';

  Future<Map<String, dynamic>> getFoodTypeServiceMethod({
    required String endPoint,
  }) async {
    var response = await dio.get('$mealBaseUrl$endPoint');
    return response.data;
  }
}

//https://tasty.p.rapidapi.com/recipes/list?from=0&size=10&q=$query
//https://www.themealdb.com/api/json/v1/1/search.php?s=chicken
//https://www.themealdb.com/api/json/v1/1/filter.php?a=Egyptian
