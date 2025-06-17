import 'package:flutter_project1/features/weather_screen/domain/entities/city_information.dart';
import 'package:flutter_project1/features/weather_screen/domain/repository/weather_repository.dart';

class GetCityNameUseCase{
  late final WeatherRepository weatherRepository;
  GetCityNameUseCase(this.weatherRepository);

  Future<List<CityInformation>> call(String key, String cityName) async{
    return weatherRepository.getCityName(key, cityName);
  }
}