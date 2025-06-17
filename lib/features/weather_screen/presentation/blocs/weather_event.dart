part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class FetchWeather extends WeatherEvent{
  final String apiKey;
  final String cityName;
  final int days;

  const FetchWeather(this.apiKey, this.cityName, this.days);

  @override
  List<Object?> get props => [apiKey, cityName, days];
}

class SearchCityName extends WeatherEvent{
  final String apiKey;
  final String cityName;

  const SearchCityName(this.apiKey, this.cityName);

  @override
  List<Object?> get props => [apiKey, cityName];
}


