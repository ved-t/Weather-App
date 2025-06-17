import 'package:flutter/material.dart';
import 'package:flutter_project1/core/util/time_converter.dart';
import 'package:flutter_project1/features/weather_screen/domain/entities/weather_info.dart';

class WeatherForecastItem extends StatefulWidget {
  final Hour? hour;
  const WeatherForecastItem({super.key, this.hour});

  @override
  State<WeatherForecastItem> createState() => _WeatherForecastItemState();
}

class _WeatherForecastItemState extends State<WeatherForecastItem> {
  late final time = TimeConverter.fromEpochSeconds(widget.hour!.timeEpoch!.toInt()) ;
  late final imagePath = widget.hour!.condition!.icon ?? "";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal
                  ),
                ),
                SizedBox(
                  height: 8,
                ),

                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    "https:$imagePath",
                    loadingBuilder: (context, child, loadingProgress){
                      if(loadingProgress == null) {
                        return child;
                      } else {
                        return CircularProgressIndicator();
                      }},
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                ),

                SizedBox(
                  height: 8,
                ),
                Text(
                  "${widget.hour!.tempF} °F",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
