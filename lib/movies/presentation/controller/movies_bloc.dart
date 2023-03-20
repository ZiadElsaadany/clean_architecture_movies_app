import 'package:clean_architecture_movies_app/core/utls/enums/request_state.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_events.dart';
import 'package:clean_architecture_movies_app/movies/presentation/controller/movies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MoviesBloc(this.getNowPlayingMoviesUseCase) : super(const MoviesStates()) {
    ///  call event
    on<GetNowPlayingEvent>((event, emit) async {
      // event --> GetNowPlayingEvent
      // emit     --> talk with ui   to refresh

      final result =await getNowPlayingMoviesUseCase.execute();

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
