import 'package:flutter/foundation.dart';

import '../../domain/entities/tv.dart';
import '../../domain/usecases/get_top_rated_tv_series.dart';
import '../../utils/state_enum.dart';

class TopRatedTvSeriesNotifier extends ChangeNotifier {
  final GetTopRatedTvSeries getTopRatedTvSeries;

  TopRatedTvSeriesNotifier(this.getTopRatedTvSeries);

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<Tv> _tvSeries = [];

  List<Tv> get tvSeries => _tvSeries;

  String _message = '';

  String get message => _message;

  Future<void> fetchTopRatedTvSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTvSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (moviesData) {
        _tvSeries = moviesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
