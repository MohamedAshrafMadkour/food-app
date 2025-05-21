import 'package:dio/dio.dart';

class ApiPaymentService {
  final Dio dio = Dio();
  Future<Response> post({
    String? contentType,
    required body,
    required String url,
    String? token,
    Map<String, String>? headers,
  }) async {
    var response = await dio.post(
      url,
      data: body,

      options: Options(
        contentType: contentType,
        headers: headers ?? {'Authorization': "Bearer $token"},
      ),
    );
    return response;
  }
}
