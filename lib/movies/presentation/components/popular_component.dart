import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/utls/app_string.dart';
import '../screens/movie_detail_screen.dart';
import '../screens/see_more.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder< MoviesBloc,MoviesStates>(
        buildWhen: (previous, current)=>previous.popularState!=current.popularState,

        builder: (ctx,state) {

      return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.popular,
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
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return  SeeMoreScreen(lst:


                      state.popularMovies,
                        title: "Popular Movies",
                        );
                      } ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Text(AppString.seeMore,
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
            SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.popularMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.popularMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                            return MovieDetailScreen(id: movie.id);
                          } ));
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstant.imageUrl(movie.backdropPath??""),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );    }) ;



  }
}
