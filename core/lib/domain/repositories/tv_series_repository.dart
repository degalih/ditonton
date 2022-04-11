import 'package:dartz/dartz.dart';
import 'package:ditonton/utils/failure.dart';
import 'package:ditonton/domain/entities/tv.dart';
import 'package:ditonton/domain/entities/tv_series_detail.dart';

abstract class TvSeriesRepository {
  Future<Either<Failure, List<Tv>>> getOnTheAirTvSeries();

  Future<Either<Failure, List<Tv>>> getPopularTvSeries();

  Future<Either<Failure, List<Tv>>> getTopRatedTvSeries();

  Future<Either<Failure, TvSeriesDetail>> getTvSeriesDetail(int id);

  Future<Either<Failure, List<Tv>>> getTvSeriesRecommendation(int id);

  Future<Either<Failure, String>> saveWatchlistTvSeries(
      TvSeriesDetail tvSeriesDetail);

  Future<Either<Failure, String>> removeWatchlistTvSeries(
      TvSeriesDetail tvSeriesDetail);

  Future<bool> isAddedToWatchlistTvSeries(int id);

  Future<Either<Failure, List<Tv>>> getWatchlistTvSeries();

  Future<Either<Failure, List<Tv>>> searchTvSeries(String query);
}
