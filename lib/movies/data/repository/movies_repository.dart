import 'package:clean_architecture_movies_app/core/error/exceptions.dart';
import 'package:clean_architecture_movies_app/core/error/failure.dart';
import 'package:clean_architecture_movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_architecture_movies_app/movies/data/models/movie_details_model.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_recommendation_use_case.dart';
import 'package:dartz/dartz.dart';

class  MoviesRepository extends BaseMovieRepository{
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository({required this.baseMovieRemoteDataSource});
  @override
  Future<Either<Failure , List<MovieEntity> >> getNowPlayingMovies()  async{
  final result = await  baseMovieRemoteDataSource.getNowPlayingMovies();
  try {
    return Right(result!);
  }on ServerException catch (failure){
return Left(ServerFailure(
  message: failure.errorMessageModel.statusMessage
));
  }
  // محتاج ارجع اتنين اوبجكت ف نفس الميثود بتاعت الايرور او ال ليست
  }

  @override
  Future<Either<Failure , List<MovieEntity> >> getPopularMovies() async{
    final result = await  baseMovieRemoteDataSource.getPopularMovies();
    try {
      return Right(result!);
    }on ServerException catch (failure){
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage
      ));
    }

  }

  @override
  Future<Either<Failure , List<MovieEntity> >> getTopRatedMovies() async{
    final result = await  baseMovieRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result!);
    }on ServerException catch (failure){
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage
      ));
    }

  }

  @override
  Future<Either<Failure, MovieDetailsEntity>> getMovieDetails(MovieDetailsParameters movieDetailsParams ) async{
    final result = await  baseMovieRemoteDataSource.getMovieDetails(movieDetailsParams);
    try {
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage
      ));
    }
  }

  @override
  Future<Either<Failure, List<RecommendationEntity>>> getRecommendation({required RecommendationParameter parameter}) async{

    final result = await  baseMovieRemoteDataSource.getRecommendation(parameter);
    try {
      return Right(result);
    }on ServerException catch (failure){
      return Left(ServerFailure(
          message: failure.errorMessageModel.statusMessage
      ));
    }
  }



}