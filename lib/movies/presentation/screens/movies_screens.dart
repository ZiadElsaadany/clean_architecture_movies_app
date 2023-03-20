
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_events.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx){
        // new event
        return MoviesBloc()..add(GetNowPlayingEvent());
      },
       lazy: false,  //   play getNowPlaying
      child: BlocBuilder<MoviesBloc , MoviesStates>(
        builder: (ctx,state) {

          return const   Scaffold(

          );
        },
      ),

    );
  }
}
