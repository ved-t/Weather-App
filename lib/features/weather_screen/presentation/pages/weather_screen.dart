import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/core/constants/constants.dart';
import 'package:flutter_project1/features/weather_screen/presentation/blocs/weather_bloc.dart';
import 'package:flutter_project1/features/weather_screen/presentation/widgets/additinal_info_section.dart';
import 'package:flutter_project1/features/weather_screen/presentation/widgets/header_card.dart';
import 'package:flutter_project1/features/weather_screen/presentation/widgets/my_app_bar.dart';
import 'package:flutter_project1/features/weather_screen/presentation/widgets/search_bar.dart';
import 'package:flutter_project1/features/weather_screen/presentation/widgets/weather_forecast_section.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override 
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(
        FetchWeather(Constants.API_KEY, "Mumbai", 1));
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc bloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoading || state is WeatherInitial) {
                return CircularProgressIndicator();
              }
              else if (state is WeatherError) {
                return Text(
                  state.errorMessage,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                );
              }
              else if (state is WeatherLoadedNew) {
                if(state.isWeatherLoading){
                  return CircularProgressIndicator();
                }
                else if (state.weatherErrorString != null){
                  return Text(
                    state.weatherErrorString ?? "",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                  );
                }
                else if (state.weatherForecast != null) {
                  final weatherForecast = state.weatherForecast!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MySearchBar(),
                      SizedBox(width: double.infinity, height: 12),

                      HeaderCard(weatherForecast: weatherForecast,),
                      SizedBox(width: double.infinity, height: 12),

                      WeatherForecastSection(
                        weatherForecast: weatherForecast,),
                      SizedBox(width: double.infinity, height: 12),

                      AdditionalInfoSection(
                        weatherForecast: weatherForecast,)
                    ],
                  );
                }
              }
              return Center(
                child: Container(
                  child: Text("Nothing to display"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
