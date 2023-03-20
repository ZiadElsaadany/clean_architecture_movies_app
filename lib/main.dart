import 'package:clean_architecture_movies_app/core/services/services_locator.dart';
import 'package:clean_architecture_movies_app/movies/presentation/screens/movies_screens.dart';
import 'package:flutter/material.dart';

void main ( )  {
  ServiceLocator().init();
  runApp(MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies App",
      debugShowCheckedModeBanner: false,
      home: MoviesScreen(),
    );
  }
}
