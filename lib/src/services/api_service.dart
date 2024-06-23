import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:network_topology_gis/src/base/base.dart';

class ApiService {
  final _dio = Dio();

  Future<Response?> get({
    required String baseUrl,
    required String path,
    // required LatLng cLatLng,
    Map<String, dynamic>? queryParameters,
    bool authentication = true,
  }) async {
    try {
      final response = await _dio.get(
        '$baseUrl$path',
        queryParameters: queryParameters,
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            // 'latLng': '${cLatLng.latitude}, ${cLatLng.longitude}',
            'Authorization': 'Bearer ${Base.userController.token.value}',
          },
        ),
      );
      return response;
    } catch (e) {
      log('$e');
      throw ('Something went wrong');
    }
  }

  Future<Response> post({
    required String baseUrl,
    required String path,
    // required LatLng cLatLng,
    dynamic body,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl$path',
        data: body,
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            // 'latLng': '${cLatLng.latitude}, ${cLatLng.longitude}',
            'Authorization': 'Bearer ${Base.userController.token.value}',
          },
        ),
      );

      return response;
    } catch (e) {
      log('$e');
      throw ('Something went wrong');
    }
  }

  Future<Response> put({
    required String baseUrl,
    required String path,
    // required LatLng cLatLng,
    dynamic body,
  }) async {
    try {
      final response = await _dio.put(
        '$baseUrl$path',
        data: body,
        options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            // 'latLng': '${cLatLng.latitude}, ${cLatLng.longitude}',
            'Authorization': 'Bearer ${Base.userController.token.value}',
          },
        ),
      );

      return response;
    } catch (e) {
      log('$e');
      throw ('Something went wrong');
    }
  }
}
