import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project1/features/weather_screen/presentation/blocs/weather_bloc.dart';
import 'package:flutter_project1/features/weather_screen/presentation/pages/weather_screen.dart';
import 'package:flutter_project1/core/di/injection.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Weather App",
        home: BlocProvider(
          create: (context) => di.sl<WeatherBloc>(),
          child: const WeatherScreen(),
        )
    );
  }
}
