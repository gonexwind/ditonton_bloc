import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';
import 'package:movies/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:tv_series/tv_series.dart';
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
      BlocProvider.of<WatchlistMovieCubit>(context).getWatchListData();
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
          title: const Text('Watchlist'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TabBar(
                indicatorColor: kMikadoYellow,
                tabs: [
                  Tab(child: Text('Movie')),
                  Tab(child: Text('TV Series')),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<WatchlistMovieCubit, WatchlistMovieState>(
                      builder: (context, state) {
                        if (state is WatchlistMovieLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is WatchlistMovieLoaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final movie = state.watchlistMovies[index];
                              return MovieCard(movie);
                            },
                            itemCount: state.watchlistMovies.length,
                          );
                        } else if (state is WatchlistMovieError) {
                          return Center(
                            key: const Key('error_message'),
                            child: Text(state.message),
                          );
                        } else {
                          return const Center(
                            child: Text("Failed to get data"),
                          );
                        }
                      },
                    ),
                    Consumer<WatchlistTVSeriesNotifier>(
                      builder: (context, data, child) {
                        if (data.watchlistState == RequestState.Loading) {
                          return const Center(
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
