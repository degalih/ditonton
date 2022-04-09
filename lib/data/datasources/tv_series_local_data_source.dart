import 'package:ditonton/data/datasources/db/database_helper_tv_series.dart';
import 'package:ditonton/data/models/tv_series_table.dart';

import '../../common/exception.dart';

abstract class TvSeriesLocalDataSource {
  Future<String> insertWatchlistTvSeries(TvSeriesTable tvSeriesTable);

  Future<String> removeWatchlistTvSeries(TvSeriesTable tvSeriesTable);

  Future<TvSeriesTable?> getTvSeriesById(int id);

  Future<List<TvSeriesTable>> getWatchlistTvSeries();
}

class TvSeriesLocalDataSourceImpl implements TvSeriesLocalDataSource {
  final DatabaseHelperTvSeries databaseHelper;

  TvSeriesLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<String> insertWatchlistTvSeries(TvSeriesTable tvSeriesTable) async {
    try {
      await databaseHelper.insertWatchlistTvSeries(tvSeriesTable);
      return 'Added to Watchlist TV Series';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlistTvSeries(TvSeriesTable tvSeriesTable) async {
    try {
      await databaseHelper.removeWatchlistTvSeries(tvSeriesTable);
      return 'Removed from Watchlist TV Series';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<TvSeriesTable?> getTvSeriesById(int id) async {
    final result = await databaseHelper.getTvSeriesById(id);
    if (result != null) {
      return TvSeriesTable.fromMap(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TvSeriesTable>> getWatchlistTvSeries() async {
    final result = await databaseHelper.getWatchlistTvSeries();
    return result.map((data) => TvSeriesTable.fromMap(data)).toList();
  }
}
