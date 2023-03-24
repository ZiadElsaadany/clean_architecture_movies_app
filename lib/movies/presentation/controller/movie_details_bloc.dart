import 'package:clean_architecture_movies_app/core/utls/enums/request_state.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/movie_details.dart';
import 'package:clean_architecture_movies_app/movies/domain/entities/recommendation.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_movie_details_use_case.dart';
import 'package:clean_architecture_movies_app/movies/domain/usecases/get_recommendation_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc({
    required this.getMovieDetailsUseCase,
    required this.getRecommendationUseCase
}) : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      final result =await getMovieDetailsUseCase(
          MovieDetailsParameters(
            movieId: event.id
          )
      );
      //   because method is call

      result.fold(
              (l) => emit(
              state.copyWith(

                message: l.message,
                requestDetailsState:RequestState.error

              )
          ),
              (r) => emit(state.copyWith(
                movieDetailsEntity:  r,
                requestDetailsState:RequestState.loaded
          )));

    }

    );

    on<GetMovieRecommendationEvent>((event, emit) async {
      final result =await getRecommendationUseCase(
RecommendationParameter(
  event.id
)
      );
      //   because method is call

      result.fold(
              (l) => emit(
              state.copyWith(
 messageRecommendation: l.message

              )
          ),
              (r) => emit(state.copyWith(
              recommendationEntity: r,
                requestDetailsState: RequestState.loaded
          )));

    }

    );
  }
}
