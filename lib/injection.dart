import 'package:movies/data/datasources/db/database_helper.dart';
import 'package:tv_series/data/datasources/db/database_helper_tv_series.dart';
import 'package:movies/data/datasources/movie_local_data_source.dart';
import 'package:movies/data/datasources/movie_remote_data_source.dart';
import 'package:tv_series/data/datasources/tv_series_local_data_source.dart';
import 'package:tv_series/data/datasources/tv_series_remote_data_source.dart';
import 'package:movies/data/repositories/movie_repository_impl.dart';
import 'package:tv_series/data/repositories/tv_series_repository_impl.dart';
import 'package:movies/domain/repositories/movie_repository.dart';
import 'package:tv_series/domain/repositories/tv_series_repository.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_now_playing_movies.dart';
import 'package:tv_series/domain/usecases/get_on_the_air_tv_series.dart';
import 'package:movies/domain/usecases/get_popular_movies.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:movies/domain/usecases/get_top_rated_movies.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:tv_series/domain/usecases/get_tv_series_detail.dart';
import 'package:tv_series/domain/usecases/get_tv_series_recommendations.dart';
import 'package:movies/presentation/provider/movie_detail_notifier.dart';
import 'package:movies/presentation/provider/movie_list_notifier.dart';
import 'package:search/bloc/movies/search_bloc.dart';
import 'package:search/bloc/tv_series/search_tv_series_bloc.dart';

import 'package:search/search.dart';
import 'package:movies/presentation/provider/now_playing_movies_notifier.dart';
import 'package:tv_series/presentation/provider/on_the_air_tv_series_notifier.dart';
import 'package:movies/presentation/provider/popular_movies_notifier.dart';
import 'package:tv_series/presentation/provider/popular_tv_series_notifier.dart';
import 'package:movies/presentation/provider/top_rated_movies_notifier.dart';
import 'package:tv_series/presentation/provider/top_rated_tv_series_notifier.dart';
import 'package:tv_series/presentation/provider/tv_list_notifier.dart';
import 'package:tv_series/presentation/provider/tv_series_detail_notifier.dart';


import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:watchlist/domain/usecases/movies/get_watchlist_movies.dart';
import 'package:watchlist/domain/usecases/movies/get_watchlist_status.dart';
import 'package:watchlist/domain/usecases/movies/remove_watchlist.dart';
import 'package:watchlist/domain/usecases/movies/save_watchlist.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_status_tv_series.dart';
import 'package:watchlist/domain/usecases/tv_series/get_watchlist_tv_series.dart';
import 'package:watchlist/domain/usecases/tv_series/remove_watchlist_tv_series.dart';
import 'package:watchlist/domain/usecases/tv_series/save_watchlist_tv_series.dart';
import 'package:watchlist/presentation/provider/watchlist_movie_notifier.dart';
import 'package:watchlist/presentation/provider/watchlist_tv_series_notifier.dart';

final locator = GetIt.instance;

void init() {
  locator.registerFactory(
    () => SearchBloc(
      locator(),
    ),
  );
  // provider | Tv Series
  locator.registerFactory(
    () => SearchTvSeriesBloc(
      locator(),
    ),
  );

  locator.registerFactory(
    () => TvSeriesDetailNotifier(
      getTvSeriesDetail: locator(),
      getTvSeriesRecommendations: locator(),
      getWatchListStatusTvSeries: locator(),
      removeWatchlistTvSeries: locator(),
      saveWatchlistTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => TvListNotifier(
      getOnTheAirTvSeries: locator(),
      getPopularTvSeries: locator(),
      getTopRatedTvSeries: locator(),
    ),
  );

  locator.registerFactory(
    () => OnTheAirTvSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => PopularTvSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => TopRatedTvSeriesNotifier(
      locator(),
    ),
  );

  locator.registerFactory(
    () => WatchlistTvSeriesNotifier(
      getWatchlistTvSeries: locator(),
    ),
  );

  // provider | Movie
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );

  locator.registerFactory(
    () => NowPlayingMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );

  // use case | Tv Series
  locator.registerLazySingleton(() => GetOnTheAirTvSeries(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTopRatedTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvSeriesDetail(locator()));
  locator.registerLazySingleton(() => GetTvSeriesRecommendations(locator()));
  locator.registerLazySingleton(() => GetWatchListStatusTvSeries(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => GetWatchlistTvSeries(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));

  // use case | Movie
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));

  // repository | Tv Series
  locator.registerLazySingleton<TvSeriesRepository>(
    () => TvSeriesRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // repository | Movie
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources | Tv Series
  locator.registerLazySingleton<TvSeriesRemoteDataSource>(
      () => TvSeriesRemoteDataSourceImpl(httpClient: locator()));
  locator.registerLazySingleton<TvSeriesLocalDataSource>(
      () => TvSeriesLocalDataSourceImpl(databaseHelper: locator()));

  // data sources | Movie
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(httpClient: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<DatabaseHelperTvSeries>(
      () => DatabaseHelperTvSeries());

  // external
  locator.registerLazySingleton(() => http.Client());
}
