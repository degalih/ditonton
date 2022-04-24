import 'package:core/utils/state_enum.dart';
import 'package:flutter/foundation.dart';
import 'package:tv_series/domain/entities/tv.dart';

import '../../domain/usecases/tv_series/get_watchlist_tv_series.dart';
import '../../domain/usecases/tv_series/get_watchlist_tv_series.dart';

class WatchlistTvSeriesNotifier extends ChangeNotifier {
  var _watchlistTvSeries = <Tv>[];

  List<Tv> get watchlistTvSeries => _watchlistTvSeries;

  var _watchlistTvSeriesState = RequestState.Empty;

  RequestState get watchlistTvSeriesState => _watchlistTvSeriesState;

  String _message = '';

  String get message => _message;

  WatchlistTvSeriesNotifier({required this.getWatchlistTvSeries});

  final GetWatchlistTvSeries getWatchlistTvSeries;

  Future<void> fetchWatchlistTvSeries() async {
    _watchlistTvSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getWatchlistTvSeries.execute();
    result.fold(
      (failure) {
        _watchlistTvSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _watchlistTvSeriesState = RequestState.Loaded;
        _watchlistTvSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }
}
