import 'package:clean_architecture_movies_app/core/use_case/base_use_case.dart';
import 'package:clean_architecture_movies_app/core/utls/enums/request_state.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_popular_movies.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_top_rated.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_events.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularUseCase;
  final GetTopRatedMoviesUseCase getTopRatedUseCase;

  MoviesBloc(
      this.getNowPlayingMoviesUseCase,
      this.getPopularUseCase,
      this.getTopRatedUseCase
      ) : super(const MoviesStates()) {
    ///  call event
    on<GetNowPlayingEvent>((event, emit) async {
      // event --> GetNowPlayingEvent
      // emit     --> talk with ui   to refresh

      final result =await getNowPlayingMoviesUseCase(const NoParameter());
      //   because method is call

      result.fold(
          (l) => emit(
            state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message
            )
          ),
          (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded, nowPlayingMovies: r
          )));
    });

    on<GetPopularEvent>((event, emit) async{

      final result =await getPopularUseCase(const NoParameter());
      result.fold(
              (l) => emit(
                state.copyWith(
                    popularState: RequestState.error,
                    popularMessage: l.message
                )
              ),
              (r) => emit(state.copyWith(
                  popularState: RequestState.loaded, popularMovies: r
              )));

    });


  on<GetTopRatedEvent>((event, emit) async{

  final result =await getTopRatedUseCase(const NoParameter());
  result.fold(
  (l) => emit(
  state.copyWith(

  topRatedStates: RequestState.error,
  topRatedMessage: l.message
  )
  ),
  (r) => emit(state.copyWith(
  topRatedStates: RequestState.loaded, topRatedMovies: r
  )));

});
    }
}
