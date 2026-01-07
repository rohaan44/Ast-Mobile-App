import 'dart:developer';
import 'package:dio/dio.dart';

Dio getDio() {
  Dio dio = Dio();
  dio.interceptors.add(AppInterceptors());
  return dio;
}

class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Log request
    log("➡️ REQUEST");
    log("URL: ${options.baseUrl}${options.path}");
    log("Method: ${options.method}");
    if (options.data != null) log("Body: ${options.data}");
    if (options.headers.isNotEmpty) log("Headers: ${options.headers}");

    // If header "isAuthRequired" is present, inject token
    if (options.headers.containsKey("isAuthRequired")) {
      final token = options.headers["isAuthRequired"];

      options.headers.remove("isAuthRequired");
      options.headers["Authorization"] = token;

      log("🔐 AUTH Token added");
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("⬅️ RESPONSE");
    log("STATUS: ${response.statusCode}");
    log("DATA: ${response.data}");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("❌ ERROR");
    log("MESSAGE: ${err.message}");
    log("******Error StatusCode******\n ${err.response?.statusCode ?? ""}");
    log("RESPONSE: ${err.response?.data}");

    if (err.response?.data is Map && err.response?.data["message"] != null) {
      err.response?.data["errorMessage"] = err.response?.data["message"];
    }

    super.onError(err, handler);
  }
}
