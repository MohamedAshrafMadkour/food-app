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
}
