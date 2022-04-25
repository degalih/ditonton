part of 'watchlist_movies_bloc.dart';

abstract class WatchlistMoviesEvent extends Equatable {
  const WatchlistMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetWatchlistMoviesEvent extends WatchlistMoviesEvent {}

class GetWatchlistStatusEvent extends WatchlistMoviesEvent {
  final int id;

  GetWatchlistStatusEvent(this.id);
}

class SaveWatchlistEvent extends WatchlistMoviesEvent {
  final MovieDetail movie;

  SaveWatchlistEvent(this.movie);

  @override
  List<Object> get props => [movie];
}

class RemoveWatchlistEvent extends WatchlistMoviesEvent {
  final MovieDetail movie;

  RemoveWatchlistEvent(this.movie);

  @override
  List<Object> get props => [movie];
}
