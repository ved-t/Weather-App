import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_project1/features/weather_screen/data/models/weather_forecast.dart';
import 'package:flutter_project1/features/weather_screen/domain/entities/city_information.dart';
import 'package:flutter_project1/features/weather_screen/domain/usecases/get_cityname_usecase.dart';
import 'package:flutter_project1/features/weather_screen/domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';
part 'weather_event.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase _getWeatherUseCase;
  final GetCityNameUseCase _getCityNameUseCase;

  WeatherBloc(this._getWeatherUseCase, this._getCityNameUseCase) : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      final currentState = state;
      if(state is WeatherLoadedNew){
        emit((currentState as WeatherLoadedNew).copyWith(isWeatherLoading: true));
      }
      else{
        emit(WeatherLoadedNew(isWeatherLoading: true));
      }

      try{
        final weatherData = await _getWeatherUseCase(event.apiKey, event.cityName, event.days);
        print("Weather data: ${weatherData.location?.country}");
        emit((currentState as WeatherLoadedNew).copyWith(isWeatherLoading: false, weatherErrorString: null, weatherForecast: weatherData));
      }
      catch(e){
        emit((currentState as WeatherLoadedNew).copyWith(isWeatherLoading: false, weatherForecast: null, weatherErrorString: "Unable to load data. ${e.toString()}"));
        print("Exception at bloc: ${e.toString()}");
      }
    });

    on<SearchCityName>((event, emit) async{
      final currentState = state;
      if(state is WeatherLoadedNew){
        emit((currentState as WeatherLoadedNew).copyWith(isCityInfoLoading: true, cityInfoErrorString: null));
      }
      else{
        emit(WeatherLoadedNew(isCityInfoLoading: true));
      }

      try{
        final cities = await _getCityNameUseCase(event.apiKey, event.cityName);
        print("Cities data: ${cities.toString()}");
        emit((currentState as WeatherLoadedNew).copyWith(isCityInfoLoading: false, cityInformation: cities));
      }
      catch(e){
        emit((currentState as WeatherLoadedNew).copyWith(isCityInfoLoading: false ,cityInfoErrorString: "Unable to load data. ${e.toString()}"));
        print("Exception at bloc: ${e.toString()}");
      }
    });
  }
}
