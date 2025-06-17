import 'package:flutter/material.dart';
import 'package:flutter_project1/features/weather_screen/domain/entities/weather_info.dart';

class HeaderCard extends StatefulWidget {
  final WeatherForecast weatherForecast;
  const HeaderCard({super.key, required this.weatherForecast});

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  late final String imagePath =
      widget.weatherForecast.current!.condition!.icon ?? "";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        backgroundBlendMode: BlendMode.hardLight,
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "${widget.weatherForecast.current?.tempF} °F",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          "Feels like ${widget.weatherForecast.current?.tempF} °F",
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),

                SizedBox(
                  width: 120,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          "https:$imagePath",
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error);
                          },
                        ),
                      ),

                      Text(
                        "${widget.weatherForecast.current?.condition?.text}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),


          const SizedBox(width: double.infinity, height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Date",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Day ",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Night ",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
