import 'package:clean_architecture_movies_app/core/utls/enums/request_state.dart';
import 'package:clean_architecture_movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:clean_architecture_movies_app/movies/data/repository/movies_repository.dart';
import 'package:clean_architecture_movies_app/movies/domain/repository/base_movies_repo.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_events.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  MoviesBloc() : super(const MoviesStates()) {
    ///  call event
    on<GetNowPlayingEvent>((event, emit) async {
      // event --> GetNowPlayingEvent
      // emit     --> talk with ui   to refresh

      BaseMovieRemoteDataSource baseMovieRemoteDataSource =
          MovieRemoteDataSource();
      BaseMovieRepository baseMovieRepository = MoviesRepository(
          baseMovieRemoteDataSource: baseMovieRemoteDataSource);

      final result = await GetNowPlayingMoviesUseCase(
              baseMovieRepository: baseMovieRepository)
          .execute();

      emit(const MoviesStates(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(MoviesStates(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(MoviesStates(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
    });
  }
}
