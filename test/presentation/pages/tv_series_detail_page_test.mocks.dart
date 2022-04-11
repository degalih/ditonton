// Mocks generated by Mockito 5.1.0 from annotations
// in ditonton/test/presentation/pages/tv_series_detail_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i11;
import 'dart:ui' as _i12;

import 'package:core/utils/state_enum.dart' as _i9;
import 'package:core/domain/entities/tv.dart' as _i10;
import 'package:core/domain/entities/tv_series_detail.dart' as _i7;
import 'package:core/domain/usecases/get_tv_series_detail.dart' as _i2;
import 'package:core/domain/usecases/get_tv_series_recommendations.dart'
    as _i3;
import 'package:core/domain/usecases/get_watchlist_status_tv_series.dart'
    as _i4;
import 'package:core/domain/usecases/remove_watchlist_tv_series.dart'
    as _i6;
import 'package:core/domain/usecases/save_watchlist_tv_series.dart' as _i5;
import 'package:core/presentation/provider/tv_series_detail_notifier.dart'
    as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetTvSeriesDetail_0 extends _i1.Fake
    implements _i2.GetTvSeriesDetail {}

class _FakeGetTvSeriesRecommendations_1 extends _i1.Fake
    implements _i3.GetTvSeriesRecommendations {}

class _FakeGetWatchListStatusTvSeries_2 extends _i1.Fake
    implements _i4.GetWatchListStatusTvSeries {}

class _FakeSaveWatchlistTvSeries_3 extends _i1.Fake
    implements _i5.SaveWatchlistTvSeries {}

class _FakeRemoveWatchlistTvSeries_4 extends _i1.Fake
    implements _i6.RemoveWatchlistTvSeries {}

class _FakeTvSeriesDetail_5 extends _i1.Fake implements _i7.TvSeriesDetail {}

/// A class which mocks [TvSeriesDetailNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesDetailNotifier extends _i1.Mock
    implements _i8.TvSeriesDetailNotifier {
  MockTvSeriesDetailNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetTvSeriesDetail get getTvSeriesDetail =>
      (super.noSuchMethod(Invocation.getter(#getTvSeriesDetail),
          returnValue: _FakeGetTvSeriesDetail_0()) as _i2.GetTvSeriesDetail);
  @override
  _i3.GetTvSeriesRecommendations get getTvSeriesRecommendations =>
      (super.noSuchMethod(Invocation.getter(#getTvSeriesRecommendations),
              returnValue: _FakeGetTvSeriesRecommendations_1())
          as _i3.GetTvSeriesRecommendations);
  @override
  _i4.GetWatchListStatusTvSeries get getWatchListStatusTvSeries =>
      (super.noSuchMethod(Invocation.getter(#getWatchListStatusTvSeries),
              returnValue: _FakeGetWatchListStatusTvSeries_2())
          as _i4.GetWatchListStatusTvSeries);
  @override
  _i5.SaveWatchlistTvSeries get saveWatchlistTvSeries =>
      (super.noSuchMethod(Invocation.getter(#saveWatchlistTvSeries),
              returnValue: _FakeSaveWatchlistTvSeries_3())
          as _i5.SaveWatchlistTvSeries);
  @override
  _i6.RemoveWatchlistTvSeries get removeWatchlistTvSeries =>
      (super.noSuchMethod(Invocation.getter(#removeWatchlistTvSeries),
              returnValue: _FakeRemoveWatchlistTvSeries_4())
          as _i6.RemoveWatchlistTvSeries);
  @override
  _i7.TvSeriesDetail get tvSeriesDetail =>
      (super.noSuchMethod(Invocation.getter(#tvSeriesDetail),
          returnValue: _FakeTvSeriesDetail_5()) as _i7.TvSeriesDetail);
  @override
  _i9.RequestState get tvSeriesState =>
      (super.noSuchMethod(Invocation.getter(#tvSeriesState),
          returnValue: _i9.RequestState.Empty) as _i9.RequestState);
  @override
  List<_i10.Tv> get tvSeriesRecommendations =>
      (super.noSuchMethod(Invocation.getter(#tvSeriesRecommendations),
          returnValue: <_i10.Tv>[]) as List<_i10.Tv>);
  @override
  _i9.RequestState get recommendationState =>
      (super.noSuchMethod(Invocation.getter(#recommendationState),
          returnValue: _i9.RequestState.Empty) as _i9.RequestState);
  @override
  String get message =>
      (super.noSuchMethod(Invocation.getter(#message), returnValue: '')
          as String);
  @override
  bool get isAddedToWatchlistTvSeries =>
      (super.noSuchMethod(Invocation.getter(#isAddedToWatchlistTvSeries),
          returnValue: false) as bool);
  @override
  String get watchlistTvSeriesMessage =>
      (super.noSuchMethod(Invocation.getter(#watchlistTvSeriesMessage),
          returnValue: '') as String);
  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);
  @override
  _i11.Future<void> fetchTvSeriesDetail(int? id) => (super.noSuchMethod(
      Invocation.method(#fetchTvSeriesDetail, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i11.Future<void>);
  @override
  _i11.Future<void> addWatchlistTvSeries(_i7.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
              Invocation.method(#addWatchlistTvSeries, [tvSeriesDetail]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i11.Future<void>);
  @override
  _i11.Future<void> removeFromWatchlistTvSeries(
          _i7.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
              Invocation.method(#removeFromWatchlistTvSeries, [tvSeriesDetail]),
              returnValue: Future<void>.value(),
              returnValueForMissingStub: Future<void>.value())
          as _i11.Future<void>);
  @override
  _i11.Future<void> loadWatchlistStatusTvSeries(int? id) => (super.noSuchMethod(
      Invocation.method(#loadWatchlistStatusTvSeries, [id]),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i11.Future<void>);
  @override
  void addListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#addListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void removeListener(_i12.VoidCallback? listener) =>
      super.noSuchMethod(Invocation.method(#removeListener, [listener]),
          returnValueForMissingStub: null);
  @override
  void dispose() => super.noSuchMethod(Invocation.method(#dispose, []),
      returnValueForMissingStub: null);
  @override
  void notifyListeners() =>
      super.noSuchMethod(Invocation.method(#notifyListeners, []),
          returnValueForMissingStub: null);
}