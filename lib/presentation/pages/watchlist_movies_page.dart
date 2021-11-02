import 'package:ditonton/utils/constants.dart';
import 'package:ditonton/utils/state_enum.dart';
import 'package:ditonton/presentation/provider/watchlist_movie_notifier.dart';
import 'package:ditonton/presentation/provider/watchlist_tv_series_notifier.dart';
import 'package:ditonton/presentation/widgets/movie_card_list.dart';
import 'package:ditonton/presentation/widgets/tv_series_card_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/watchlist-movie';

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<WatchlistMovieNotifier>(context, listen: false)
          .fetchWatchlistMovies();
      Provider.of<WatchlistTVSeriesNotifier>(context, listen: false)
          .fetchWatchlistTVSeries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watchlist'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TabBar(
                indicatorColor: kMikadoYellow,
                tabs: [
                  Tab(child: Text('Movie')),
                  Tab(child: Text('TV Series')),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    Consumer<WatchlistMovieNotifier>(
                      builder: (context, data, child) {
                        if (data.watchlistState == RequestState.Loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (data.watchlistState == RequestState.Loaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final movie = data.watchlistMovies[index];
                              return MovieCard(movie);
                            },
                            itemCount: data.watchlistMovies.length,
                          );
                        } else {
                          return Center(
                            key: Key('error_message'),
                            child: Text(data.message),
                          );
                        }
                      },
                    ),
                    Consumer<WatchlistTVSeriesNotifier>(
                      builder: (context, data, child) {
                        if (data.watchlistState == RequestState.Loading) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (data.watchlistState == RequestState.Loaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final tvSeries = data.watchlistTVSeries[index];
                              return TVSeriesCard(tvSeries);
                            },
                            itemCount: data.watchlistTVSeries.length,
                          );
                        } else {
                          return Center(
                            key: Key('error_message'),
                            child: Text(data.message),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
