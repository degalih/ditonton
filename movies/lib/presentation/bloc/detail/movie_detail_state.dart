part of 'movie_detail_bloc.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieEmpty extends MovieDetailState {}

class MovieLoading extends MovieDetailState {}

class MovieHasData extends MovieDetailState {
  final MovieDetail movie;

  MovieHasData(this.movie);

  @override
  List<Object> get props => [movie];
}

class MovieError extends MovieDetailState {
  final String message;

  MovieError(this.message);

  @override
  List<Object> get props => [message];
}
