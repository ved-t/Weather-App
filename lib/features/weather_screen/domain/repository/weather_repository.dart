import 'package:flutter_project1/features/weather_screen/domain/entities/city_information.dart';

import '../entities/weather_info.dart';

abstract class WeatherRepository{
  Future<WeatherForecast> getWeather(String key, String cityName, int days);
  Future<List<CityInformation>> getCityName(String key, String cityName);
}