import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';
import 'package:tv_series/tv_series.dart';

class HomeMoviePage extends StatefulWidget {
  @override
  _HomeMoviePageState createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
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
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WatchlistMoviesPage.ROUTE_NAME);
              },
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
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
              // FirebaseCrashlytics.instance.crash();
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: TabBar(
                controller: _controller,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: kMikadoYellow,
                ),
                labelColor: kRichBlack,
                unselectedLabelColor: Colors.white,
                tabs: const [
                  Tab(
                    child: Text('Movies'),
                  ),
                  Tab(
                    child: Text('TV Series'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  controller: _controller,
                  children: const [
                    MovieTabMenu(),
                    TVSeriesTabMenu(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieTabMenu extends StatefulWidget {
  const MovieTabMenu({Key? key}) : super(key: key);

  @override
  State<MovieTabMenu> createState() => _MovieTabMenuState();
}

class _MovieTabMenuState extends State<MovieTabMenu>
    with AutomaticKeepAliveClientMixin {
  @BlendMode.overlay
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    Future.microtask(() => BlocProvider.of<MoviesCubit>(context, listen: false)
      ..fetchMovies()
      ..fetchPopularMovies()
      ..fetchTopRatedMovies());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Now Playing',
            style: kHeading6,
          ),
          BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MoviesLoaded) {
                return MovieList(state.nowPlaying);
              } else {
                return const Text('Failed');
              }
            },
          ),
          BuildSubHeading(
            title: 'Popular',
            onTap: () =>
                Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
          ),
          BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MoviesLoaded) {
                return MovieList(state.popular);
              } else {
                return const Text('Failed');
              }
            },
          ),
          BuildSubHeading(
            title: 'Top Rated',
            onTap: () =>
                Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
          ),
          BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MoviesLoaded) {
                return MovieList(state.topRated);
              } else {
                return const Text('Failed');
              }
            },
          ),
        ],
      ),
    );
  }
}

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  const MovieList(this.movies);

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

class TVSeriesTabMenu extends StatefulWidget {
  const TVSeriesTabMenu({Key? key}) : super(key: key);

  @override
  State<TVSeriesTabMenu> createState() => _TVSeriesTabMenuState();
}

class _TVSeriesTabMenuState extends State<TVSeriesTabMenu>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    Future.microtask(
        () => BlocProvider.of<TVSeriesCubit>(context, listen: false)
          ..fetchNowPlayingTVSeries()
          ..fetchPopularTVSeries()
          ..fetchTopRatedTVSeries());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildSubHeading(
            title: 'Airing Today',
            onTap: () =>
                Navigator.pushNamed(context, AiringTVSeriesPage.ROUTE_NAME),
          ),
          BlocBuilder<TVSeriesCubit, TVSeriesState>(
            builder: (context, state) {
              if (state is TVSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TVSeriesLoaded) {
                return TVSeriesList(state.airingTodayTVSeries);
              } else {
                return const Text('Failed');
              }
            },
          ),
          BuildSubHeading(
            title: 'Popular TV Series',
            onTap: () =>
                Navigator.pushNamed(context, PopularTVSeriesPage.ROUTE_NAME),
          ),
          BlocBuilder<TVSeriesCubit, TVSeriesState>(
            builder: (context, state) {
              if (state is TVSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TVSeriesLoaded) {
                return TVSeriesList(state.popularTVSeries);
              } else {
                return const Text('Failed');
              }
            },
          ),
          BuildSubHeading(
            title: 'Top Rated TV Series',
            onTap: () =>
                Navigator.pushNamed(context, TopRatedTVSeriesPage.ROUTE_NAME),
          ),
          BlocBuilder<TVSeriesCubit, TVSeriesState>(
            builder: (context, state) {
              if (state is TVSeriesLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is TVSeriesLoaded) {
                return TVSeriesList(state.topRatedTVSeries);
              } else {
                return const Text('Failed');
              }
            },
          ),
        ],
      ),
    );
  }

  @BlendMode.overlay
  bool get wantKeepAlive => true;
}

class TVSeriesList extends StatelessWidget {
  final List<TV> items;

  TVSeriesList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tv = items[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TVSeriesDetailPage.ROUTE_NAME,
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
        itemCount: items.length,
      ),
    );
  }
}

class BuildSubHeading extends StatelessWidget {
  const BuildSubHeading({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
