import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project1/core/constants/constants.dart';
import 'package:flutter_project1/features/weather_screen/data/models/city_information.dart';
import 'package:flutter_project1/features/weather_screen/data/models/search_city_name.dart';
import 'package:flutter_project1/features/weather_screen/data/models/weather_forecast.dart';

import 'dart:developer' as developer;

class WeatherApi {
  late final Dio _dio;

  WeatherApi(this._dio) {
    _dio.options = BaseOptions(
      baseUrl: Constants.BASE_URL,
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          developer.log("Request", error: "Request: ${options.method} ${options.uri}" );
          print('Request: ${options.method} ${options.uri}');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          developer.log("Response", error: "Response: ${response.statusCode} ${response.data}" );
          print('Response: ${response.statusCode} ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          developer.log("Exception", error: "Exception: ${e.message}" );
          print('Request: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Future<WeatherForecast> getWeather(
    String key,
    String cityName,
    int days,
  ) async {
    try {
      final response = await _dio.get(
        "/forecast.json",
        queryParameters: {'key': key, 'q': cityName, 'days': days},
      );

      return WeatherForecast.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception("Failed to fetch data ${e.message}");
    }
  }

  Future<List<CityInformation>> getCityName(String key, String cityName) async{
    try{
      final response = await _dio.get(
        "/search.json",
        queryParameters: {'key': key, 'q': cityName},
      );

      List<CityInformation> cities = (response.data as List).map((item) => CityInformation.fromJson(item)).toList();
      return cities;
    }
    on DioException catch (e){
      throw Exception("Failed to fetch data ${e.message}");
    }
  }
}
