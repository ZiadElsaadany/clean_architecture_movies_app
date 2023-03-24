import 'package:clean_architecture_movies_app/core/error/failure.dart';
import 'package:clean_architecture_movies_app/core/use_case/base_use_case.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/base_movies_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetailsEntity,MovieDetailsParameters> {
  final BaseMovieRepository  baseMovieRepository ;
  GetMovieDetailsUseCase( {
    required this.baseMovieRepository
  } );

  @override
  Future<Either<Failure, MovieDetailsEntity>> call(MovieDetailsParameters parameter)  async{
    return await baseMovieRepository.getMovieDetails(parameter);

  }

}
class MovieDetailsParameters extends Equatable {
  final int movieId;
  const MovieDetailsParameters({required this.movieId});
  @override
  // TODO: implement props
  List<Object?> get props => [
    movieId

  ] ;

}