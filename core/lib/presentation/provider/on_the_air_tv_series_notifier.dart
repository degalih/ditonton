import 'package:flutter/foundation.dart';

import '../../domain/entities/tv.dart';
import '../../domain/usecases/get_on_the_air_tv_series.dart';
import '../../utils/state_enum.dart';

class OnTheAirTvSeriesNotifier extends ChangeNotifier {
  final GetOnTheAirTvSeries getOnTheAirTvSeries;

  OnTheAirTvSeriesNotifier(this.getOnTheAirTvSeries);

  RequestState _state = RequestState.Empty;

  RequestState get state => _state;

  List<Tv> _tvSeries = [];

  List<Tv> get tvSeries => _tvSeries;

  String _message = '';

  String get message => _message;

  Future<void> fetchOnTheAirTvSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getOnTheAirTvSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvSeries = tvSeriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
