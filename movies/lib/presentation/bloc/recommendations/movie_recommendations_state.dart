part of 'movie_recommendations_bloc.dart';

abstract class MovieRecommendationsState extends Equatable {
  const MovieRecommendationsState();

  @override
  List<Object> get props => [];
}

class MoviesEmpty extends MovieRecommendationsState {}

class MoviesLoading extends MovieRecommendationsState {}

class MoviesHasData extends MovieRecommendationsState {
  final List<Movie> movies;

  MoviesHasData(this.movies);

  @override
  List<Object> get props => [movies];
}

class MoviesError extends MovieRecommendationsState {
  final String message;

  MoviesError(this.message);

  @override
  List<Object> get props => [message];
}
