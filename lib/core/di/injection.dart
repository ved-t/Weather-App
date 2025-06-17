import 'package:dio/dio.dart';
import 'package:flutter_project1/features/weather_screen/data/repository/weather_repository_impl.dart';
import 'package:flutter_project1/features/weather_screen/data/sources/remote/weather_api.dart';
import 'package:flutter_project1/features/weather_screen/domain/repository/weather_repository.dart';
import 'package:flutter_project1/features/weather_screen/domain/usecases/get_cityname_usecase.dart';
import 'package:flutter_project1/features/weather_screen/domain/usecases/get_weather_usecase.dart';
import 'package:flutter_project1/features/weather_screen/presentation/blocs/weather_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async{
  sl.registerLazySingleton<Dio>(() => Dio());

  sl.registerLazySingleton<WeatherApi>(() => WeatherApi(sl()));

  sl.registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton(() => GetWeatherUseCase(sl()));
  sl.registerLazySingleton(() => GetCityNameUseCase(sl()));

  sl.registerLazySingleton(() => WeatherBloc(sl(), sl()));
}