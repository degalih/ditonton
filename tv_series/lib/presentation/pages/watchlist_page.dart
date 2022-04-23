import 'package:tv_series/presentation/pages/watchlist_tv_series_page.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/watchlist_movies_page.dart';

class WatchlistPage extends StatelessWidget {
  static const ROUTE_NAME = '/watchlist';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.movie),
                text: "Movies",
              ),
              Tab(
                icon: Icon(Icons.tv_rounded),
                text: "Tv Series",
              ),
            ],
          ),
          title: const Text('Watchlist Ditonton'),
        ),
        body: TabBarView(
          children: [WatchlistMoviesPage(), WatchlistTvSeriesPage()],
        ),
      ),
    );
  }
}
