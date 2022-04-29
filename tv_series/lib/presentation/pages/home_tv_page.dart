import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/styles/text_styles.dart';
import 'package:core/utils/constants.dart';
import 'package:core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/presentation/pages/home_movie_page.dart';
import 'package:provider/provider.dart';
import 'package:tv_series/presentation/pages/popular_tv_series_page.dart';
import 'package:tv_series/presentation/pages/top_rated_tv_series_page.dart';
import 'package:tv_series/presentation/pages/tv_series_detail_page.dart';
import 'package:watchlist/presentation/pages/watchlist_page.dart';

import '../../domain/entities/tv.dart';
import '../bloc/on_the_air/on_the_air_tv_series_bloc.dart' as on_the_air;
import '../bloc/popular/popular_tv_series_bloc.dart' as popular;
import '../bloc/top_rated/top_rated_tv_series_bloc.dart' as top_rated;
import 'on_the_air_tv_series_page.dart';

class HomeTvPage extends StatefulWidget {
  static const ROUTE_NAME = '/tv-series';

  @override
  State<HomeTvPage> createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context
          .read<on_the_air.OnTheAirTvSeriesBloc>()
          .add(on_the_air.FetchOnTheAirTvSeries());
      context
          .read<popular.PopularTvSeriesBloc>()
          .add(popular.FetchPopularTvSeries());
      context
          .read<top_rated.TopRatedTvSeriesBloc>()
          .add(top_rated.FetchTopRatedTvSeries());
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
                Navigator.pushReplacementNamed(
                    context, HomeMoviePage.ROUTE_NAME);
              },
            ),
            ListTile(
              leading: Icon(Icons.tv_rounded),
              title: Text('TV Series'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistPage.ROUTE_NAME);
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
        title: Text('TV Series'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SEARCH_TV_SERIES_ROUTE);
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
                title: 'On The Air',
                onTap: () => Navigator.pushNamed(
                    context, OnTheAirTvSeriesPage.ROUTE_NAME),
              ),
              BlocBuilder<on_the_air.OnTheAirTvSeriesBloc,
                  on_the_air.OnTheAirTvSeriesState>(builder: (context, state) {
                if (state is on_the_air.TvSeriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is on_the_air.TvSeriesHasData) {
                  return TvList(state.tv);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () => Navigator.pushNamed(
                    context, PopularTvSeriesPage.ROUTE_NAME),
              ),
              BlocBuilder<popular.PopularTvSeriesBloc,
                  popular.PopularTvSeriesState>(builder: (context, state) {
                if (state is popular.TvSeriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is popular.TvSeriesHasData) {
                  return TvList(state.tv);
                } else {
                  return Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () => Navigator.pushNamed(
                    context, TopRatedTvSeriesPage.ROUTE_NAME),
              ),
              BlocBuilder<top_rated.TopRatedTvSeriesBloc,
                  top_rated.TopRatedTvSeriesState>(builder: (context, state) {
                if (state is top_rated.TvSeriesLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is top_rated.TvSeriesHasData) {
                  return TvList(state.tv);
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

class TvList extends StatelessWidget {
  final List<Tv> tvSeries;

  TvList(this.tvSeries);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = tvSeries[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvSeriesDetailPage.ROUTE_NAME,
                  arguments: tv.id,
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: tvSeries.length,
      ),
    );
  }
}
