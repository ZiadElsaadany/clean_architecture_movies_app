

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_architecture_movies_app/core/network/api_constants.dart';
import 'package:clean_architecture_movies_app/movies/presentation/components/now_playing_component.dart';
import 'package:clean_architecture_movies_app/movies/presentation/components/popular_component.dart';
import 'package:clean_architecture_movies_app/movies/presentation/components/top_rated_component.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/services/services_locator.dart';


class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (ctx)  {
      return  sl<MoviesBloc>()..add(GetNowPlayingEvent())..add(GetPopularEvent())..add(GetTopRatedEvent());
    },
    child: Scaffold(
      backgroundColor: Colors.grey.shade900,
      body:  SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NowPlayingComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      color: Colors.white
                      ,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO POPULAR SCREEN
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text('See More',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white

                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const PopularComponent(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.15,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /// TODO : NAVIGATION TO Top Rated Movies Screen
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text('See More',
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),
                          Icon(
                            color: Colors.white,

                            Icons.arrow_forward_ios,
                            size: 16.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TopRatedComponent(),
            const SizedBox(height: 50.0),

          ],
        ),
      ),
    ),
    ) ;
  }
}
