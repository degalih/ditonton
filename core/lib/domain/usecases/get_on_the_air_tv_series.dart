import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_series_repository.dart';

class GetOnTheAirTvSeries {
  final TvSeriesRepository repository;

  GetOnTheAirTvSeries(this.repository);

  Future<Either<Failure, List<Tv>>> execute() {
    return repository.getOnTheAirTvSeries();
  }
}
