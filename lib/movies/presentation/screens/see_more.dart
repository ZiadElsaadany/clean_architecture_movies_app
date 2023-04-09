import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import 'movie_detail_screen.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen({Key? key, required this.lst, required this.title}) : super(key: key);

  final List<MovieEntity>  lst ;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:Text( title),
        centerTitle: true,

      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: lst.length,
        itemBuilder: (context, index) {
          final movie = lst[index];
          return Container(decoration: BoxDecoration(
            color: Colors.grey.shade900, 
            borderRadius: BorderRadius.circular(10),
          ),
            padding: const EdgeInsets.all(10
            ),
            margin: const EdgeInsets.symmetric(
              vertical: 10
            ),
            child: InkWell(
              onTap: () {

                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return MovieDetailScreen(id: movie.id);
                } ));
              },
              child:Row(
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      width: 100.0,
                      height: 140,
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
                  const SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(lst[index].title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.1,
                            )),
                        const SizedBox(height: 5,),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                lst[index].releaseDate.split('-')[0],
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  (lst[index].voteAverage)
                                      .toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${lst[index].voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),

                          ],
                        ),
                        const SizedBox(height: 10,),

                        Text(
                          lst[index].overview,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              )
            ),
          );
        },
      ),
    );
  }
}
