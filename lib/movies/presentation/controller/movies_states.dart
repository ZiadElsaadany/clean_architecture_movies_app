import 'package:clean_architecture_movies_app/core/utls/enums/request_state.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

 class MoviesStates extends Equatable {
   final List<MovieEntity> nowPlayingMovies ;
   final RequestState  nowPlayingState;
   final String nowPlayingMessage;

   final List<MovieEntity> popularMovies ;
   final RequestState  popularState;
   final String popularMessage;

   final List<MovieEntity> topRatedMovies ;
   final RequestState  topRatedStates;
   final String topRatedMessage;
  const MoviesStates(
   {
     this.topRatedMessage="",
     this.topRatedMovies=const[],
     this.topRatedStates=RequestState.loading,

     this.nowPlayingMovies=const[],
     this.nowPlayingState=RequestState.loading,
     this.nowPlayingMessage ="",
     this.popularMovies=const[],
     this.popularState=RequestState.loading,
     this.popularMessage =""
 }
   );
  MoviesStates copyWith(

   {
     List<MovieEntity> ?nowPlayingMovies ,
     RequestState  ?nowPlayingState,
     String? nowPlayingMessage,

     List<MovieEntity>? popularMovies ,
     RequestState  ?popularState,
     String ?popularMessage,

      List<MovieEntity> ?topRatedMovies ,
      RequestState?  topRatedStates,
      String ? topRatedMessage,

 }
      ){
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies??this.nowPlayingMovies,
      nowPlayingState: nowPlayingState??this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage??this.nowPlayingMessage,
      popularMessage: popularMessage??this.popularMessage,
      popularMovies: popularMovies??this.popularMovies,
      popularState: popularState??this.popularState,
      topRatedMessage:  topRatedMessage??this.topRatedMessage ,
      topRatedMovies:  topRatedMovies??this.topRatedMovies,
      topRatedStates: topRatedStates??this.topRatedStates
    );

  }

   @override
  List<Object?> get props => [
 nowPlayingMovies,
     nowPlayingState,
     nowPlayingMessage,
    popularMessage,
     popularState,
     popularMovies,
     topRatedStates,
     topRatedMovies,
     topRatedMessage
  ];
}
