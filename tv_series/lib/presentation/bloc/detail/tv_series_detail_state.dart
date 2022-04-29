part of 'tv_series_detail_bloc.dart';

abstract class TvSeriesDetailState extends Equatable {
  const TvSeriesDetailState();

  @override
  List<Object> get props => [];
}

class TvSeriesEmpty extends TvSeriesDetailState {}

class TvSeriesLoading extends TvSeriesDetailState {}

class TvSeriesHasData extends TvSeriesDetailState {
  final TvSeriesDetail tv;

  TvSeriesHasData(this.tv);

  @override
  List<Object> get props => [tv];
}

class TvSeriesError extends TvSeriesDetailState {
  final String message;

  TvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}
