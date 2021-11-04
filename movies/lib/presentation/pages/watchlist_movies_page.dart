import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';
import 'package:movies/presentation/cubit/watchlist_movie_cubit.dart';
import 'package:tv_series/tv_series.dart';

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
      BlocProvider.of<WatchlistMovieCubit>(context, listen: false)
          .getWatchListData();
      BlocProvider.of<WatchlistTVSeriesCubit>(context, listen: false)
          .getWatchListData();
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
                    BlocBuilder<WatchlistTVSeriesCubit, WatchlistTVSeriesState>(
                      builder: (context, state) {
                        if (state is WatchlistTVLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is WatchlistTVLoaded) {
                          return ListView.builder(
                            itemBuilder: (context, index) {
                              final tvSeries = state.watchlistTVSeries[index];
                              return TVSeriesCard(tvSeries);
                            },
                            itemCount: state.watchlistTVSeries.length,
                          );
                        } else if (state is WatchlistTVError) {
                          return Center(
                            key: Key('error_message'),
                            child: Text(state.message),
                          );
                        } else {
                          return const Center(
                            child: Text("Failed to get data"),
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
