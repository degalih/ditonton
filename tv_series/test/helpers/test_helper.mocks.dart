// Mocks generated by Mockito 5.1.0 from annotations
// in tv_series/test/helpers/test_helper.dart.
// Do not manually edit this file.

import 'dart:async' as _i6;
import 'dart:convert' as _i10;
import 'dart:typed_data' as _i11;

import 'package:core/core.dart' as _i7;
import 'package:dartz/dartz.dart' as _i2;
import 'package:http/io_client.dart' as _i4;
import 'package:http/src/base_request.dart' as _i9;
import 'package:http/src/response.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;
import 'package:sqflite_sqlcipher/sqflite.dart' as _i8;
import 'package:tv_series/tv_series.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

class _FakeTvSeriesDetailResponse_1 extends _i1.Fake
    implements _i3.TvSeriesDetailResponse {}

class _FakeTvSeriesSeasonsModel_2 extends _i1.Fake
    implements _i3.TvSeriesSeasonsModel {}

class _FakeIOStreamedResponse_3 extends _i1.Fake
    implements _i4.IOStreamedResponse {}

class _FakeResponse_4 extends _i1.Fake implements _i5.Response {}

/// A class which mocks [TvSeriesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRepository extends _i1.Mock
    implements _i3.TvSeriesRepository {
  MockTvSeriesRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>> getOnTheAirTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTvSeries, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>> getPopularTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvSeries, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>> getTopRatedTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvSeries, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.TvSeriesDetail>> getTvSeriesDetail(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue:
                  Future<_i2.Either<_i7.Failure, _i3.TvSeriesDetail>>.value(
                      _FakeEither_0<_i7.Failure, _i3.TvSeriesDetail>()))
          as _i6.Future<_i2.Either<_i7.Failure, _i3.TvSeriesDetail>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>> getTvSeriesRecommendation(
          int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesRecommendation, [id]),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, _i3.TvSeriesSeasons>> getTvSeriesSeasons(
          int? id, int? season) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesSeasons, [id, season]),
              returnValue:
                  Future<_i2.Either<_i7.Failure, _i3.TvSeriesSeasons>>.value(
                      _FakeEither_0<_i7.Failure, _i3.TvSeriesSeasons>()))
          as _i6.Future<_i2.Either<_i7.Failure, _i3.TvSeriesSeasons>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> saveWatchlistTvSeries(
          _i3.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
              Invocation.method(#saveWatchlistTvSeries, [tvSeriesDetail]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, String>> removeWatchlistTvSeries(
          _i3.TvSeriesDetail? tvSeriesDetail) =>
      (super.noSuchMethod(
              Invocation.method(#removeWatchlistTvSeries, [tvSeriesDetail]),
              returnValue: Future<_i2.Either<_i7.Failure, String>>.value(
                  _FakeEither_0<_i7.Failure, String>()))
          as _i6.Future<_i2.Either<_i7.Failure, String>>);
  @override
  _i6.Future<bool> isAddedToWatchlistTvSeries(int? id) =>
      (super.noSuchMethod(Invocation.method(#isAddedToWatchlistTvSeries, [id]),
          returnValue: Future<bool>.value(false)) as _i6.Future<bool>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvSeries, []),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>);
  @override
  _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>> searchTvSeries(
          String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvSeries, [query]),
              returnValue: Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>.value(
                  _FakeEither_0<_i7.Failure, List<_i3.Tv>>()))
          as _i6.Future<_i2.Either<_i7.Failure, List<_i3.Tv>>>);
}

/// A class which mocks [TvSeriesRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesRemoteDataSource extends _i1.Mock
    implements _i3.TvSeriesRemoteDataSource {
  MockTvSeriesRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<List<_i3.TvSeriesModel>> getOnTheAirTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getOnTheAirTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i6.Future<List<_i3.TvSeriesModel>>);
  @override
  _i6.Future<List<_i3.TvSeriesModel>> getPopularTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getPopularTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i6.Future<List<_i3.TvSeriesModel>>);
  @override
  _i6.Future<List<_i3.TvSeriesModel>> getTopRatedTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getTopRatedTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i6.Future<List<_i3.TvSeriesModel>>);
  @override
  _i6.Future<_i3.TvSeriesDetailResponse> getTvSeriesDetail(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesDetail, [id]),
              returnValue: Future<_i3.TvSeriesDetailResponse>.value(
                  _FakeTvSeriesDetailResponse_1()))
          as _i6.Future<_i3.TvSeriesDetailResponse>);
  @override
  _i6.Future<List<_i3.TvSeriesModel>> getTvSeriesRecommendations(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesRecommendations, [id]),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i6.Future<List<_i3.TvSeriesModel>>);
  @override
  _i6.Future<_i3.TvSeriesSeasonsModel> getTvSeriesSeasons(
          int? id, int? season) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesSeasons, [id, season]),
              returnValue: Future<_i3.TvSeriesSeasonsModel>.value(
                  _FakeTvSeriesSeasonsModel_2()))
          as _i6.Future<_i3.TvSeriesSeasonsModel>);
  @override
  _i6.Future<List<_i3.TvSeriesModel>> searchTvSeries(String? query) =>
      (super.noSuchMethod(Invocation.method(#searchTvSeries, [query]),
              returnValue:
                  Future<List<_i3.TvSeriesModel>>.value(<_i3.TvSeriesModel>[]))
          as _i6.Future<List<_i3.TvSeriesModel>>);
}

/// A class which mocks [TvSeriesLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvSeriesLocalDataSource extends _i1.Mock
    implements _i3.TvSeriesLocalDataSource {
  MockTvSeriesLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<String> insertWatchlistTvSeries(
          _i3.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
          Invocation.method(#insertWatchlistTvSeries, [tvSeriesTable]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<String> removeWatchlistTvSeries(
          _i3.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
          Invocation.method(#removeWatchlistTvSeries, [tvSeriesTable]),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i3.TvSeriesTable?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesById, [id]),
              returnValue: Future<_i3.TvSeriesTable?>.value())
          as _i6.Future<_i3.TvSeriesTable?>);
  @override
  _i6.Future<List<_i3.TvSeriesTable>> getWatchlistTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvSeries, []),
              returnValue:
                  Future<List<_i3.TvSeriesTable>>.value(<_i3.TvSeriesTable>[]))
          as _i6.Future<List<_i3.TvSeriesTable>>);
}

/// A class which mocks [DatabaseHelperTvSeries].
///
/// See the documentation for Mockito's code generation for more information.
class MockDatabaseHelperTvSeries extends _i1.Mock
    implements _i3.DatabaseHelperTvSeries {
  MockDatabaseHelperTvSeries() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i8.Database?> get database => (super.noSuchMethod(
      Invocation.getter(#database),
      returnValue: Future<_i8.Database?>.value()) as _i6.Future<_i8.Database?>);
  @override
  _i6.Future<int> insertWatchlistTvSeries(_i3.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
          Invocation.method(#insertWatchlistTvSeries, [tvSeriesTable]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<int> removeWatchlistTvSeries(_i3.TvSeriesTable? tvSeriesTable) =>
      (super.noSuchMethod(
          Invocation.method(#removeWatchlistTvSeries, [tvSeriesTable]),
          returnValue: Future<int>.value(0)) as _i6.Future<int>);
  @override
  _i6.Future<Map<String, dynamic>?> getTvSeriesById(int? id) =>
      (super.noSuchMethod(Invocation.method(#getTvSeriesById, [id]),
              returnValue: Future<Map<String, dynamic>?>.value())
          as _i6.Future<Map<String, dynamic>?>);
  @override
  _i6.Future<List<Map<String, dynamic>>> getWatchlistTvSeries() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistTvSeries, []),
              returnValue: Future<List<Map<String, dynamic>>>.value(
                  <Map<String, dynamic>>[]))
          as _i6.Future<List<Map<String, dynamic>>>);
}

/// A class which mocks [IOClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClient extends _i1.Mock implements _i4.IOClient {
  MockHttpClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i6.Future<_i4.IOStreamedResponse> send(_i9.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#send, [request]),
              returnValue: Future<_i4.IOStreamedResponse>.value(
                  _FakeIOStreamedResponse_3()))
          as _i6.Future<_i4.IOStreamedResponse>);
  @override
  void close() => super.noSuchMethod(Invocation.method(#close, []),
      returnValueForMissingStub: null);
  @override
  _i6.Future<_i5.Response> head(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#head, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> get(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#get, [url], {#headers: headers}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> post(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#post, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> put(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#put, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> patch(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#patch, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<_i5.Response> delete(Uri? url,
          {Map<String, String>? headers,
          Object? body,
          _i10.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#delete, [url],
                  {#headers: headers, #body: body, #encoding: encoding}),
              returnValue: Future<_i5.Response>.value(_FakeResponse_4()))
          as _i6.Future<_i5.Response>);
  @override
  _i6.Future<String> read(Uri? url, {Map<String, String>? headers}) =>
      (super.noSuchMethod(Invocation.method(#read, [url], {#headers: headers}),
          returnValue: Future<String>.value('')) as _i6.Future<String>);
  @override
  _i6.Future<_i11.Uint8List> readBytes(Uri? url,
          {Map<String, String>? headers}) =>
      (super.noSuchMethod(
              Invocation.method(#readBytes, [url], {#headers: headers}),
              returnValue: Future<_i11.Uint8List>.value(_i11.Uint8List(0)))
          as _i6.Future<_i11.Uint8List>);
}
