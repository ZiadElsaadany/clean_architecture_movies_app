import 'package:clean_architecture_movies_app/core/services/services_locator.dart';
import 'package:clean_architecture_movies_app/core/utls/app_string.dart';
import 'package:flutter/material.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main ( )  {
  ServiceLocator().init();
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900
      ),
      home: const MainMoviesScreen(),
    );
  }
}
