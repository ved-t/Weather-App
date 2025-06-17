import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/core/constants/constants.dart';
import 'package:flutter_project1/features/weather_screen/presentation/blocs/weather_bloc.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<WeatherBloc>(context);

    return AppBar(
      title: Text("Weather App",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      centerTitle: true,
      actions: <Widget>[
        IconButton(onPressed: () {bloc.add(FetchWeather(Constants.API_KEY, "Mumbai", 1));}, icon: const Icon(Icons.refresh), tooltip: "Refresh Icon",)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
