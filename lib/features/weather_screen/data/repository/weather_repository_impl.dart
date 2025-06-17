import 'package:flutter_project1/features/weather_screen/data/models/city_information.dart';
import 'package:flutter_project1/features/weather_screen/data/models/weather_forecast.dart';
import 'package:flutter_project1/features/weather_screen/data/sources/remote/weather_api.dart';
import 'package:flutter_project1/features/weather_screen/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  late final WeatherApi weatherApi;
  WeatherRepositoryImpl(this.weatherApi);

  @override
  Future<WeatherForecast> getWeather(String key, String cityName, int days) {
    return weatherApi.getWeather(key, cityName, days);
  }

  @override
  Future<List<CityInformation>> getCityName(String key, String cityName) {
    return weatherApi.getCityName(key, cityName);
  }
}