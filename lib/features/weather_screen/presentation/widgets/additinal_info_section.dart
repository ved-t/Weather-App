import 'package:flutter/material.dart';
import 'package:flutter_project1/features/weather_screen/domain/entities/weather_info.dart';

import 'additional_info_item.dart';

class AdditionalInfoSection extends StatelessWidget {
  final WeatherForecast weatherForecast;
  const AdditionalInfoSection({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Additional Information",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(width: double.infinity, height: 8),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment
                .spaceEvenly,
            children: [
              AdditionalInfoItem(
                title: "Humidity", amount: weatherForecast.current?.humidity,),
              AdditionalInfoItem(
                title: "Wind Speed", amount: weatherForecast.current?.windKph,),
              AdditionalInfoItem(
                title: "Pressure", amount: weatherForecast.current?.pressureMb,)
            ],
          )
        ],
      ),
    );
  }
}

