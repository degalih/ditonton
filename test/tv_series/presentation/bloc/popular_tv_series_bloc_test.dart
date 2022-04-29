import 'package:bloc_test/bloc_test.dart';
import 'package:core/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/presentation/bloc/popular/popular_tv_series_bloc.dart';

import '../../../core/dummy_data/dummy_objects.dart';
import '../provider/popular_tv_series_notifier_test.mocks.dart';

@GenerateMocks([GetPopularTvSeries])
void main() {
  late PopularTvSeriesBloc popularTvSeriesBloc;
  late MockGetPopularTvSeries mockGetPopularTvSeries;

  setUp(() {
    mockGetPopularTvSeries = MockGetPopularTvSeries();
    popularTvSeriesBloc = PopularTvSeriesBloc(mockGetPopularTvSeries);
  });

  test('initial state should be empty', () {
    expect(popularTvSeriesBloc.state, TvSeriesEmpty());
  });

  blocTest<PopularTvSeriesBloc, PopularTvSeriesState>(
    'Should emit [Loading, HasData] when data is gotten successfully',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Right(testTvSeriesList));
      return popularTvSeriesBloc;
    },
    act: (bloc) => bloc.add(FetchPopularTvSeries()),
    expect: () => [
      TvSeriesLoading(),
      TvSeriesHasData(testTvSeriesList),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );

  blocTest<PopularTvSeriesBloc, PopularTvSeriesState>(
    'Should emit [Loading, Error] when data unsuccessful loaded',
    build: () {
      when(mockGetPopularTvSeries.execute())
          .thenAnswer((_) async => Left(ServerFailure('Server Failure')));
      return popularTvSeriesBloc;
    },
    act: (bloc) => bloc.add(FetchPopularTvSeries()),
    expect: () => [
      TvSeriesLoading(),
      TvSeriesError('Server Failure'),
    ],
    verify: (bloc) {
      verify(mockGetPopularTvSeries.execute());
    },
  );
}
