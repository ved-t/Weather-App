import 'package:flutter_project1/features/weather_screen/domain/entities/weather_info.dart';
import 'package:flutter_project1/features/weather_screen/domain/repository/weather_repository.dart';

class GetWeatherUseCase{
  late final WeatherRepository weatherRepository;
  GetWeatherUseCase(this.weatherRepository);

  Future<WeatherForecast> call(String key, String cityName, int days) async{
    return weatherRepository.getWeather(key, cityName, days);
  }
}