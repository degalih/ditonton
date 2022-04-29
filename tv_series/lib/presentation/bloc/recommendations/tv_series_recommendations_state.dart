part of 'tv_series_recommendations_bloc.dart';

abstract class TvSeriesRecommendationsState extends Equatable {
  const TvSeriesRecommendationsState();

  @override
  List<Object> get props => [];
}

class TvSeriesRecommendationsEmpty extends TvSeriesRecommendationsState {}

class TvSeriesRecommendationsLoading extends TvSeriesRecommendationsState {}

class TvSeriesRecommendationsHasData extends TvSeriesRecommendationsState {
  final List<Tv> tv;

  TvSeriesRecommendationsHasData(this.tv);

  @override
  List<Object> get props => [tv];
}

class TvSeriesRecommendationsError extends TvSeriesRecommendationsState {
  final String message;

  TvSeriesRecommendationsError(this.message);

  @override
  List<Object> get props => [message];
}
