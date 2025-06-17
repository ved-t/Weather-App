import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/core/constants/constants.dart';
import 'package:flutter_project1/features/weather_screen/domain/entities/city_information.dart';
import 'package:flutter_project1/features/weather_screen/presentation/blocs/weather_bloc.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WeatherBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "City Name",
                suffixIcon: IconButton(
                    onPressed: () {
                      bloc.add(SearchCityName(Constants.API_KEY, _controller.text));
                    }, icon: Icon(Icons.search))
            ),
            onChanged: (value) {},
          ),
          BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state){
                if(state is WeatherLoadedNew){
                  if(state.cityInformation != null) {
                    final cities = state.cityInformation!;
                    return DropdownButton(
                        items: cities.map<
                            DropdownMenuItem<CityInformation>>((cityName) {
                          return DropdownMenuItem(child: Text(
                              cityName.name ?? ""));
                        }).toList(), onChanged: (CityInformation? cityName) {});
                  }
                }
                return CircularProgressIndicator();
              }
          )
        ],
      ),
    );
  }

  final TextEditingController _controller = TextEditingController();
}
