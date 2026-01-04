import 'package:ast_official/core/network/auth_service/auth_service.dart';
import 'package:ast_official/core/network/network_services/api_interceptors.dart';
import 'package:dio/dio.dart';
class DioHelper {
  final Dio dio = getDio();

  Options baseOptions = Options(
    contentType: "application/json",
    receiveDataWhenStatusError: true,
  );

  Future<dynamic> get({
    required String url,
    bool isAuthRequired = false,
    Map<String, dynamic>? headers,
  }) async {
    final option = baseOptions.copyWith(
      headers: headers ?? {},
    );

    final res = await dio.get(url, options: option);
    return res.data;
  }

  Future<dynamic> post({
    required String url,
    Object? requestBody,
    bool isAuthRequired = false,
    Map<String, dynamic>? headers,
  }) async {
    final option = baseOptions.copyWith(
      headers: isAuthRequired
          ? {
              "Authorization": "Bearer ${await AuthStorage.getToken()}",
              "Content-Type": "application/json",
            }
          : {
              "Content-Type": "application/json",
            },
    );

    final res = await dio.post(
      url,
      data: requestBody,
      options: option,
    );

    return res.data;
  }

  Future<dynamic> put({
    required String url,
    Object? requestBody,
    Map<String, dynamic>? headers,
  }) async {
    final option = baseOptions.copyWith(headers: headers);

    final res = await dio.put(url, data: requestBody, options: option);
    return res.data;
  }

  Future<dynamic> delete({
    required String url,
    Object? requestBody,
    Map<String, dynamic>? headers,
  }) async {
    final option = baseOptions.copyWith(headers: headers);

    final res = await dio.delete(url, data: requestBody, options: option);
    return res.data;
  }
}
