//* THIS IS A SINGLETON CLASS WITH A PRIVATE CONSTRUCTOR AND A STATIC INSTANCE
import 'package:bloc_app/common/values/app_constants.dart';
import 'package:dio/dio.dart';

class HttpUtils {
  static final HttpUtils _instance =
      HttpUtils._internal(); // private constructor

  factory HttpUtils() {
    return _instance;
  }

  late Dio dio;

  HttpUtils._internal() {
    // note that we have used . operator after the class name because this is a constructor
    // and not a member function
    BaseOptions options = BaseOptions(
      validateStatus: (status) => true,
      baseUrl: AppConstants.SERVER_API_URL,
      // for local testing, always use ipv4 address that u get from ipconfig, not the default address for php artisan serve
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {},
      // contentType: "application/json: charset=utf-8",
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    dio = Dio(options);
  }

  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    // print();
    try {
      var response =
          await dio.post(path, data: data, queryParameters: queryParameters);
      // print("The response data obtained was ${response.data.toString()}");
      // print("The response obtained was ${response.toString()}");
      return response.data;
    } catch (e) {
      print("The error that occured here was: ${e.toString()}");
    }
  }

  void get() {}
  void update() {}
}
