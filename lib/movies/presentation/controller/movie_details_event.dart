part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent  extends Equatable{
  const MovieDetailsEvent();

}
class   GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id ;
  const GetMovieDetailsEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [
    id
  ];
}
class GetMovieRecommendationEvent extends MovieDetailsEvent {
final int id;

  const GetMovieRecommendationEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id
  ];

}