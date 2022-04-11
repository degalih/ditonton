import 'package:dartz/dartz.dart';

import '../../utils/failure.dart';
import '../entities/tv.dart';
import '../repositories/tv_series_repository.dart';

class SearchTvSeries {
  final TvSeriesRepository repository;

  SearchTvSeries(this.repository);

  Future<Either<Failure, List<Tv>>> execute(String query) {
    return repository.searchTvSeries(query);
  }
}
