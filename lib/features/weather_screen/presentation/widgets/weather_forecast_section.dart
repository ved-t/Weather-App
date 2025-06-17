import 'package:flutter/material.dart';
import 'package:flutter_project1/features/weather_screen/domain/entities/weather_info.dart';
import 'package:flutter_project1/features/weather_screen/presentation/widgets/weather_forecast_item.dart';

class WeatherForecastSection extends StatelessWidget {
  final WeatherForecast weatherForecast;
  const WeatherForecastSection({super.key, required this.weatherForecast});


  @override
  Widget build(BuildContext context) {
    late final forecastList = weatherForecast.forecast!.forecastday!.single.hour;
    print(forecastList!.length);
    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Weather Forecast",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 8,
              width: double.infinity,
            ),

            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: forecastList.length,
                  itemBuilder: (context, index) => WeatherForecastItem(hour: forecastList[index])
              ),
            )
          ],
        )
    );
  }
}
