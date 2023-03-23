import 'package:clean_architecture_movies_app/core/use_case/base_use_case.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase  extends BaseUseCase<List<MovieEntity>,NoParameter>{


  final BaseMovieRepository  baseMovieRepository ;
  GetNowPlayingMoviesUseCase( {
    required this.baseMovieRepository
} );

  // call -->        calling with constructor
  @override
  Future<Either<Failure , List<MovieEntity> >> call(NoParameter parameter) async {
    return   await  baseMovieRepository.getNowPlayingMovies()   ;
  }

}