import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';

// no implementation here   contract only
abstract class BaseMovieRepository {

Future<List<MovieEntity>>  getNowPlaying();
Future<List<MovieEntity>>  getPopularMovies(); //  add release data in entity

Future<List<MovieEntity>>  getTopRatedMovies();

}