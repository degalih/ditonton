import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:watchlist/domain/usecases/tv_series/remove_watchlist_tv_series.dart';

import '../../../core/dummy_data/dummy_objects.dart';
import '../../../core/helpers/test_helper.mocks.dart';

void main() {
  late RemoveWatchlistTvSeries usecase;
  late MockTvSeriesRepository mockTvSeriesRepository;

  setUp(() {
    mockTvSeriesRepository = MockTvSeriesRepository();
    usecase = RemoveWatchlistTvSeries(mockTvSeriesRepository);
  });

  test('should remove watchlist TV Series from repository', () async {
    // arrange
    when(mockTvSeriesRepository.removeWatchlistTvSeries(testTvSeriesDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTvSeriesDetail);
    // assert
    verify(mockTvSeriesRepository.removeWatchlistTvSeries(testTvSeriesDetail));
    expect(result, Right('Removed from watchlist'));
  });
}
