import 'package:dartz/dartz.dart';

import 'package:core/utils/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_series_repository.dart';

class GetTvSeriesRecommendations {
  final TvSeriesRepository repository;

  GetTvSeriesRecommendations(this.repository);

  Future<Either<Failure, List<Tv>>> execute(id) {
    return repository.getTvSeriesRecommendation(id);
  }
}
