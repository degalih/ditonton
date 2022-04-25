part of 'watchlist_movies_bloc.dart';

abstract class WatchlistMoviesState extends Equatable {
  const WatchlistMoviesState();

  @override
  List<Object> get props => [];
}

class WatchlistEmpty extends WatchlistMoviesState{}

class WatchlistLoading extends WatchlistMoviesState{}

class WatchlistError extends WatchlistMoviesState{
  final String message;

  WatchlistError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistHasData extends WatchlistMoviesState{
  final List<Movie> result;

  WatchlistHasData(this.result);

  @override
  List<Object> get props => [result];
}

class IsAddedToWatchListMovie extends WatchlistMoviesState {
  final bool isAdded;
  final String message;

  IsAddedToWatchListMovie(this.isAdded, this.message);

  @override
  List<Object> get props => [isAdded, message];
}
