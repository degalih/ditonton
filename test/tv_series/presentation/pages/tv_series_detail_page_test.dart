import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/presentation/bloc/detail/tv_series_detail_bloc.dart';
import 'package:tv_series/presentation/bloc/recommendations/tv_series_recommendations_bloc.dart';
import 'package:tv_series/presentation/pages/tv_series_detail_page.dart';
import 'package:watchlist/presentation/bloc/tv_series/watchlist_tv_series_bloc.dart';

import '../../../core/dummy_data/dummy_objects.dart';

class FakeTvSeriesDetailEvent extends Fake implements TvSeriesDetailEvent {}

class FakeTvSeriesDetailState extends Fake implements TvSeriesDetailState {}

class FakeTvSeriesDetailBloc
    extends MockBloc<TvSeriesDetailEvent, TvSeriesDetailState>
    implements TvSeriesDetailBloc {}

class FakeTvSeriesRecommendationsEvent extends Fake
    implements TvSeriesRecommendationsEvent {}

class FakeTvSeriesRecommendationsState extends Fake
    implements TvSeriesRecommendationsState {}

class FakeTvSeriesRecommendationsBloc
    extends MockBloc<TvSeriesRecommendationsEvent, TvSeriesRecommendationsState>
    implements TvSeriesRecommendationsBloc {}

class FakeWatchlistTvSeriesEvent extends Fake
    implements WatchlistTvSeriesEvent {}

class FakeWatchlistTvSeriesState extends Fake
    implements WatchlistTvSeriesState {}

class FakeWatchlistTvSeriesBloc
    extends MockBloc<WatchlistTvSeriesEvent, WatchlistTvSeriesState>
    implements WatchlistTvSeriesBloc {}

void main() {
  late FakeTvSeriesDetailBloc fakeTvSeriesDetailBloc;
  late FakeTvSeriesRecommendationsBloc fakeTvSeriesRecommendationsBloc;
  late FakeWatchlistTvSeriesBloc fakeWatchlistTvSeriesBloc;

  setUp(() {
    registerFallbackValue(FakeTvSeriesDetailEvent());
    registerFallbackValue(FakeTvSeriesDetailState());
    fakeTvSeriesDetailBloc = FakeTvSeriesDetailBloc();

    registerFallbackValue(FakeTvSeriesRecommendationsEvent());
    registerFallbackValue(FakeTvSeriesRecommendationsState());
    fakeTvSeriesRecommendationsBloc = FakeTvSeriesRecommendationsBloc();

    registerFallbackValue(FakeWatchlistTvSeriesEvent());
    registerFallbackValue(FakeWatchlistTvSeriesState());
    fakeWatchlistTvSeriesBloc = FakeWatchlistTvSeriesBloc();
  });

  Widget _makeTestableWidget(Widget body) {
    return MultiProvider(
      providers: [
        BlocProvider<TvSeriesDetailBloc>(
          create: (context) => fakeTvSeriesDetailBloc,
        ),
        BlocProvider<TvSeriesRecommendationsBloc>(
          create: (context) => fakeTvSeriesRecommendationsBloc,
        ),
        BlocProvider<WatchlistTvSeriesBloc>(
          create: (context) => fakeWatchlistTvSeriesBloc,
        ),
      ],
      child: MaterialApp(
        home: body,
      ),
    );
  }

  testWidgets(
      'Watchlist button should display add icon when movie not added to watchlist',
      (WidgetTester tester) async {
    when(() => fakeTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesHasData(testTvSeriesDetail));
    when(() => fakeTvSeriesRecommendationsBloc.state)
        .thenReturn(TvSeriesRecommendationsHasData(<Tv>[]));
    when(() => fakeWatchlistTvSeriesBloc.state)
        .thenReturn(IsAddedToWatchListTvSeries(false, ''));

    final watchlistButtonIcon = find.byIcon(Icons.add);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should dispay check icon when movie is added to wathclist',
      (WidgetTester tester) async {
    when(() => fakeTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesHasData(testTvSeriesDetail));
    when(() => fakeTvSeriesRecommendationsBloc.state)
        .thenReturn(TvSeriesRecommendationsHasData(<Tv>[]));
    when(() => fakeWatchlistTvSeriesBloc.state)
        .thenReturn(IsAddedToWatchListTvSeries(true, ''));

    final watchlistButtonIcon = find.byIcon(Icons.check);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(watchlistButtonIcon, findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when added to watchlist',
      (WidgetTester tester) async {
    when(() => fakeTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesHasData(testTvSeriesDetail));
    when(() => fakeTvSeriesRecommendationsBloc.state)
        .thenReturn(TvSeriesRecommendationsHasData(<Tv>[]));
    when(() => fakeWatchlistTvSeriesBloc.state)
        .thenReturn(IsAddedToWatchListTvSeries(false, 'Added to Watchlist'));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.add), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Added to Watchlist'), findsOneWidget);
  });

  testWidgets(
      'Watchlist button should display Snackbar when removed from watchlist',
      (WidgetTester tester) async {
    when(() => fakeTvSeriesDetailBloc.state)
        .thenReturn(TvSeriesHasData(testTvSeriesDetail));
    when(() => fakeTvSeriesRecommendationsBloc.state)
        .thenReturn(TvSeriesRecommendationsHasData(<Tv>[]));
    when(() => fakeWatchlistTvSeriesBloc.state)
        .thenReturn(IsAddedToWatchListTvSeries(true, 'Removed from Watchlist'));

    final watchlistButton = find.byType(ElevatedButton);

    await tester.pumpWidget(_makeTestableWidget(TvSeriesDetailPage(id: 1)));

    expect(find.byIcon(Icons.check), findsOneWidget);

    await tester.tap(watchlistButton);
    await tester.pump();

    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.text('Removed from Watchlist'), findsOneWidget);
  });
}
