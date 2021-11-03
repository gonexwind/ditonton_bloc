part of 'movies_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError(this.message);

  @override
  List<Object> get props => [message];
}

class MoviesLoaded extends MoviesState {
  final List<Movie> nowPlaying;
  final List<Movie> popular;
  final List<Movie> topRated;

  const MoviesLoaded(this.nowPlaying, this.popular, this.topRated);

  @override
  List<Object> get props => [nowPlaying, popular, topRated];
}

class MoviesPopularLoaded extends MoviesState {
  final List<Movie> popular;

  const MoviesPopularLoaded(this.popular);

  @override
  List<Object> get props => [popular];
}

class MoviesTopRatedLoaded extends MoviesState {
  final List<Movie> topRated;

  const MoviesTopRatedLoaded(this.topRated);

  @override
  List<Object> get props => [topRated];
}
