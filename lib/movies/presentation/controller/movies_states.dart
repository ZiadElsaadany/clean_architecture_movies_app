import 'package:clean_architecture_movies_app/core/utls/enums/request_state.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

 class MoviesStates extends Equatable {
   final List<MovieEntity> nowPlayingMovies ;
   final RequestState  nowPlayingState;
   final String nowPlayingMessage;

  const MoviesStates(
   {
     this.nowPlayingMovies=const[],
     this.nowPlayingState=RequestState.loading,
     this.nowPlayingMessage =""
 }
   );

   @override
  List<Object?> get props => [
 nowPlayingMovies,
     nowPlayingState,
     nowPlayingMessage
  ];
}
