part of 'popular_tv_series_bloc.dart';

abstract class PopularTvSeriesState extends Equatable {
  const PopularTvSeriesState();

  @override
  List<Object> get props => [];
}

class TvSeriesEmpty extends PopularTvSeriesState {}

class TvSeriesLoading extends PopularTvSeriesState {}

class TvSeriesHasData extends PopularTvSeriesState {
  final List<Tv> tv;

  TvSeriesHasData(this.tv);

  @override
  List<Object> get props => [tv];
}

class TvSeriesError extends PopularTvSeriesState {
  final String message;

  TvSeriesError(this.message);

  @override
  List<Object> get props => [message];
}
