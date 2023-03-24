part of 'movie_details_bloc.dart';


class MovieDetailsState extends Equatable {
  const MovieDetailsState({
     this.movieDetailsEntity  ,
     this.requestDetailsState = RequestState.loading,
     this.messageDetails="",


    this.messageRecommendation= "",
    this.requestRecommendationState=RequestState.loading,
    this.recommendationEntity=const []
  });
  // movie details
  final MovieDetailsEntity ?   movieDetailsEntity ;
  final RequestState requestDetailsState;
  final String messageDetails ;

  // movie recommendation
  final List<RecommendationEntity>    recommendationEntity ;
  final RequestState requestRecommendationState;
  final String messageRecommendation ;


  @override
  // TODO: implement props
  List<Object?> get props => [
    movieDetailsEntity,
    requestDetailsState,
    messageDetails,
    recommendationEntity,
    requestRecommendationState,
    messageRecommendation
  ] ;
  MovieDetailsState copyWith(

      {
         MovieDetailsEntity ?   movieDetailsEntity ,
         RequestState? requestDetailsState,
         String?  message ,
        List<RecommendationEntity>    ?recommendationEntity ,
         RequestState ?requestRecommendationState,
         String ? messageRecommendation ,

      }
      ){
    return MovieDetailsState(
      messageDetails:  message??messageDetails,
      movieDetailsEntity:movieDetailsEntity??this.movieDetailsEntity  ,
      requestDetailsState:requestDetailsState??this.requestDetailsState,
      messageRecommendation: messageRecommendation??this.messageRecommendation,
      recommendationEntity: recommendationEntity??this.recommendationEntity,
      requestRecommendationState:requestRecommendationState??this.requestRecommendationState
    );

  }



}
