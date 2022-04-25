part of 'watchlist_tv_series_bloc.dart';

abstract class WatchlistTvSeriesEvent extends Equatable {
  const WatchlistTvSeriesEvent();

  @override
  List<Object> get props => [];
}

class GetWatchlistTvSeriesEvent extends WatchlistTvSeriesEvent {}

class GetWatchlistStatusEvent extends WatchlistTvSeriesEvent {
  final int id;

  GetWatchlistStatusEvent(this.id);
}

class SaveWatchlistEvent extends WatchlistTvSeriesEvent {
  final TvSeriesDetail tv;

  SaveWatchlistEvent(this.tv);

  @override
  List<Object> get props => [tv];
}

class RemoveWatchlistEvent extends WatchlistTvSeriesEvent {
  final TvSeriesDetail tv;

  RemoveWatchlistEvent(this.tv);

  @override
  List<Object> get props => [tv];
}