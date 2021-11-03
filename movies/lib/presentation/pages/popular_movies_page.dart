import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/movies.dart';

class PopularMoviesPage extends StatefulWidget {
  static const ROUTE_NAME = '/popular-movie';

  @override
  _PopularMoviesPageState createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        BlocProvider.of<MovieListCubit>(context, listen: false)
            .fetchPopularMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<MovieListCubit, MovieListState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MoviesLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = state.popular[index];
                  return MovieCard(movie);
                },
                itemCount: state.popular.length,
              );
            } else if (state is MoviesError){
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
      ),
    );
  }
}
