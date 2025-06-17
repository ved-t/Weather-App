part of 'weather_bloc.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
}

final class WeatherInitial extends WeatherState {
  @override
  List<Object> get props => [];
}

class WeatherLoading extends WeatherState {
  @override
  List<Object?> get props => [];
}

class WeatherLoaded extends WeatherState {
  final WeatherForecast weatherForecast;

  const WeatherLoaded(this.weatherForecast);

  @override
  List<Object?> get props => [weatherForecast];
}

class WeatherLoadedNew extends WeatherState {
  final bool isWeatherLoading;
  final String? weatherErrorString;
  final WeatherForecast? weatherForecast;

  final bool isCityInfoLoading;
  final String? cityInfoErrorString;
  final List<CityInformation>? cityInformation;

  const WeatherLoadedNew({
    this.isWeatherLoading = false,
    this.weatherErrorString,
    this.weatherForecast,
    this.isCityInfoLoading = false,
    this.cityInfoErrorString,
    this.cityInformation
  });

  WeatherLoadedNew copyWith({
    bool? isWeatherLoading,
    String? weatherErrorString,
    WeatherForecast? weatherForecast,

    bool? isCityInfoLoading,
    String? cityInfoErrorString,
    List<CityInformation>? cityInformation
  }) {
    return WeatherLoadedNew(
      isWeatherLoading: isWeatherLoading ?? this.isWeatherLoading,
      weatherErrorString: weatherErrorString ?? this.weatherErrorString,
      weatherForecast: weatherForecast ?? this.weatherForecast,

      isCityInfoLoading: isWeatherLoading ?? this.isCityInfoLoading,
      cityInfoErrorString: cityInfoErrorString ?? this.cityInfoErrorString,
      cityInformation: cityInformation ?? this.cityInformation
    );
  }

  @override
  List<Object?> get props => [isWeatherLoading, weatherErrorString, weatherForecast, isCityInfoLoading, cityInfoErrorString, cityInformation];
}

class WeatherError extends WeatherState {
  final String errorMessage;

  const WeatherError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}

class CityName extends WeatherState {
  final List<CityInformation> cities;

  const CityName(this.cities);

  @override
  List<Object?> get props => [cities];
}
