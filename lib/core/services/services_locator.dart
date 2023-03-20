import 'package:clean_architecture_movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_architecture_movies_app/movies/data/repository/movies_repository.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServiceLocator {
  void init  ( ){
    ///Bloc
    ///
    /// new object from MovieBloc
    sl.registerFactory(() => MoviesBloc(sl()));


    /// Use cases

    sl.registerLazySingleton(() =>GetNowPlayingMoviesUseCase(
        baseMovieRepository: sl()
    ) );

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(() =>
        MoviesRepository(
            baseMovieRemoteDataSource: sl()
    ));
    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(()
    => MovieRemoteDataSource() );
  }
}