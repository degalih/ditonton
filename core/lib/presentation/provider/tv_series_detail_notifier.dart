import 'package:flutter/foundation.dart';

import '../../domain/entities/tv.dart';
import '../../domain/entities/tv_series_detail.dart';
import '../../domain/usecases/get_tv_series_detail.dart';
import '../../domain/usecases/get_tv_series_recommendations.dart';
import '../../domain/usecases/get_watchlist_status_tv_series.dart';
import '../../domain/usecases/remove_watchlist_tv_series.dart';
import '../../domain/usecases/save_watchlist_tv_series.dart';
import '../../utils/state_enum.dart';

class TvSeriesDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist TV Series';
  static const watchlistRemoveSuccessMessage =
      'Removed from Watchlist TV Series';

  final GetTvSeriesDetail getTvSeriesDetail;
  final GetTvSeriesRecommendations getTvSeriesRecommendations;
  final GetWatchListStatusTvSeries getWatchListStatusTvSeries;
  final SaveWatchlistTvSeries saveWatchlistTvSeries;
  final RemoveWatchlistTvSeries removeWatchlistTvSeries;

  TvSeriesDetailNotifier({
    required this.getTvSeriesDetail,
    required this.getTvSeriesRecommendations,
    required this.getWatchListStatusTvSeries,
    required this.saveWatchlistTvSeries,
    required this.removeWatchlistTvSeries,
  });

  late TvSeriesDetail _tvSeriesDetail;
  TvSeriesDetail get tvSeriesDetail => _tvSeriesDetail;

  RequestState _tvSeriesState = RequestState.Empty;
  RequestState get tvSeriesState => _tvSeriesState;

  List<Tv> _tvSeriesRecommendations = [];
  List<Tv> get tvSeriesRecommendations => _tvSeriesRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlistTvSeries = false;
  bool get isAddedToWatchlistTvSeries => _isAddedtoWatchlistTvSeries;

  Future<void> fetchTvSeriesDetail(int id) async {
    _tvSeriesState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getTvSeriesDetail.execute(id);
    final recommendationResult = await getTvSeriesRecommendations.execute(id);
    detailResult.fold(
      (failure) {
        _tvSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesItem) {
        _recommendationState = RequestState.Loading;
        _tvSeriesDetail = tvSeriesItem;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (tvSeries) {
            _recommendationState = RequestState.Loaded;
            _tvSeriesRecommendations = tvSeries;
          },
        );
        _tvSeriesState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistTvSeriesMessage = '';
  String get watchlistTvSeriesMessage => _watchlistTvSeriesMessage;

  Future<void> addWatchlistTvSeries(TvSeriesDetail tvSeriesDetail) async {
    final result = await saveWatchlistTvSeries.execute(tvSeriesDetail);

    await result.fold(
      (failure) async {
        _watchlistTvSeriesMessage = failure.message;
      },
      (successMessage) async {
        _watchlistTvSeriesMessage = successMessage;
      },
    );

    await loadWatchlistStatusTvSeries(tvSeriesDetail.id);
  }

  Future<void> removeFromWatchlistTvSeries(
      TvSeriesDetail tvSeriesDetail) async {
    final result = await removeWatchlistTvSeries.execute(tvSeriesDetail);

    await result.fold(
      (failure) async {
        _watchlistTvSeriesMessage = failure.message;
      },
      (successMessage) async {
        _watchlistTvSeriesMessage = successMessage;
      },
    );

    await loadWatchlistStatusTvSeries(tvSeriesDetail.id);
  }

  Future<void> loadWatchlistStatusTvSeries(int id) async {
    final result = await getWatchListStatusTvSeries.execute(id);
    _isAddedtoWatchlistTvSeries = result;
    notifyListeners();
  }
}
