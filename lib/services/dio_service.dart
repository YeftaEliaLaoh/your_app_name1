import 'package:dio/dio.dart';
import "dart:convert";

class DioService {
  DioService._();

  /// Get Method
  static Future<dynamic> getURL(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then((response) {
      return response;
    });
  }

  static Future<dynamic> postURL(String url, Map<String, Object> params) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .post(url,
            options: Options(responseType: ResponseType.json, method: 'POST'),
              data: jsonEncode(params))
        .then((response) {
      return response;
    });
  }
}
