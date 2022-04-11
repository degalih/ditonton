
import 'package:flutter/foundation.dart';

import '../../domain/entities/tv.dart';
import '../../domain/usecases/get_on_the_air_tv_series.dart';
import '../../domain/usecases/get_popular_tv_series.dart';
import '../../domain/usecases/get_top_rated_tv_series.dart';
import '../../utils/state_enum.dart';

class TvListNotifier extends ChangeNotifier {
  var _onTheAirTvSeries = <Tv>[];

  List<Tv> get onTheAirTvSeries => _onTheAirTvSeries;

  RequestState _onTheAirState = RequestState.Empty;

  RequestState get onTheAirState => _onTheAirState;

  var _popularTvSeries = <Tv>[];

  List<Tv> get popularTvSeries => _popularTvSeries;

  RequestState _popularTvState = RequestState.Empty;

  RequestState get popularTvState => _popularTvState;

  var _topRatedTvSeries = <Tv>[];

  List<Tv> get topRatedTvSeries => _topRatedTvSeries;

  RequestState _topRatedTvState = RequestState.Empty;

  RequestState get topRatedTvState => _topRatedTvState;

  String _message = '';

  String get message => _message;

  TvListNotifier({
    required this.getOnTheAirTvSeries,
    required this.getPopularTvSeries,
    required this.getTopRatedTvSeries,
  });

  final GetOnTheAirTvSeries getOnTheAirTvSeries;
  final GetPopularTvSeries getPopularTvSeries;
  final GetTopRatedTvSeries getTopRatedTvSeries;

  Future<void> fetchOnTheAirTvSeries() async {
    _onTheAirState = RequestState.Loading;
    notifyListeners();

    final result = await getOnTheAirTvSeries.execute();
    result.fold(
      (failure) {
        _onTheAirState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _onTheAirState = RequestState.Loaded;
        _onTheAirTvSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTvSeries() async {
    _popularTvState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTvSeries.execute();
    result.fold(
      (failure) {
        _popularTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _popularTvState = RequestState.Loaded;
        _popularTvSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTvSeries() async {
    _topRatedTvState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeries.execute();
    result.fold(
      (failure) {
        _topRatedTvState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _topRatedTvState = RequestState.Loaded;
        _topRatedTvSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }
}
