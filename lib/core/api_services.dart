import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  final Dio _dio;
  final GetStorage _getStorage = GetStorage();

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {

    String baseUrl = endPoint;
    var response = await _dio.get(baseUrl);
    return response.data;
  }

  Future<Map<String, dynamic>> post(
      String endPoint, Map<String, dynamic> body) async {
    var response = await _dio.post(endPoint, data: body);
    return response.data;
  }

  final String _localeKey = 'app_locale';

  Future<void> setLocale(Locale locale) async {
    _getStorage.write(_localeKey, locale.languageCode);
  }
}
