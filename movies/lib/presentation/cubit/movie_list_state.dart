part of 'movie_list_cubit.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MovieListState {}

class MoviesLoading extends MovieListState {}

class MoviesError extends MovieListState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviesLoaded extends MovieListState {
  final List<Movie> nowPlaying;
  final List<Movie> popular;
  final List<Movie> topRated;

  const MoviesLoaded(this.nowPlaying, this.popular, this.topRated);

  @override
  List<Object> get props => [nowPlaying, popular, topRated];
}

class MoviesPopularLoaded extends MovieListState {
  final List<Movie> popular;

  const MoviesPopularLoaded(this.popular);

  @override
  List<Object> get props => [popular];
}

class MoviesTopRatedLoaded extends MovieListState {
  final List<Movie> topRated;

  const MoviesTopRatedLoaded(this.topRated);

  @override
  List<Object> get props => [topRated];
}
