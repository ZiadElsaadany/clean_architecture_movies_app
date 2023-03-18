import 'package:clean_architecture_movies_app/core/error/exceptions.dart';
import 'package:clean_architecture_movies_app/core/network/api_constants.dart';
import 'package:clean_architecture_movies_app/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

import '../../../core/network/error_message_model.dart';

// contract
abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>?> getNowPlayingMovies();
  Future<List<MovieModel>?> getPopularMovies();
  Future<List<MovieModel>?> getTopRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {


  //  methods --> from useCases
@override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(
       ApiConstant.nowPlayingPath
    );
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    }
    else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>?> getPopularMovies() {

  }

  @override
  Future<List<MovieModel>?> getTopRatedMovies() {

  }


}