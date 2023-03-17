import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movies_repo.dart';

class GetNowPlayingMoviesUseCase{


  final BaseMovieRepository  baseMovieRepository ;
  GetNowPlayingMoviesUseCase( {
    required this.baseMovieRepository
} );

 Future<List<MovieEntity>> execute() async {
    return   await  baseMovieRepository.getNowPlaying()   ;
  }

}