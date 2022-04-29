import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/pages/popular_movies_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/movie.dart';
import '../bloc/now_playing/now_playing_movies_bloc.dart' as now_playing;
import '../bloc/popular/popular_movies_bloc.dart' as popular;
import '../bloc/top_rated/top_rated_movies_bloc.dart' as top_rated;
import 'movie_detail_page.dart';
import 'now_playing_movies_page.dart';

class HomeMoviePage extends StatefulWidget {
  static const ROUTE_NAME = '/movies';

  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<now_playing.NowPlayingMoviesBloc>()
          .add(now_playing.FetchNowPlayingMovies());
      context
          .read<popular.PopularMoviesBloc>()
          .add(popular.FetchPopularMovies());
      context
          .read<top_rated.TopRatedMoviesBloc>()
          .add(top_rated.FetchTopRatedMovies());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv_rounded),
              title: Text('TV Series'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HOME_TV_SERIES_ROUTE);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WATCHLIST_PAGE_ROUTE);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, ABOUT_ROUTE);
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              // Test crash
              // FirebaseCrashlytics.instance.crash();

              Navigator.pushNamed(context, SEARCH_ROUTE);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSubHeading(
                title: 'Now Playing',
                onTap: () => Navigator.pushNamed(
                    context, NowPlayingMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<now_playing.NowPlayingMoviesBloc,
                  now_playing.NowPlayingMoviesState>(builder: (context, state) {
                if (state is now_playing.MoviesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is now_playing.MoviesHasData) {
                  return MovieList(state.movies);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<popular.PopularMoviesBloc,
                  popular.PopularMoviesState>(builder: (context, state) {
                if (state is popular.MoviesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is popular.MoviesHasData) {
                  return MovieList(state.movies);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<top_rated.TopRatedMoviesBloc,
                  top_rated.TopRatedMoviesState>(builder: (context, state) {
                if (state is top_rated.MoviesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is top_rated.MoviesHasData) {
                  return MovieList(state.movies);
                } else {
                  return Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.ROUTE_NAME,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${movie.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
