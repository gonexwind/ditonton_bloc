part of 'watchlist_movie_cubit.dart';

abstract class WatchlistMovieState extends Equatable {
  const WatchlistMovieState();

  @override
  List<Object> get props => [];
}

class WatchlistMovieInitial extends WatchlistMovieState {}

class WatchlistMovieLoading extends WatchlistMovieState {}

class WatchlistMovieError extends WatchlistMovieState {
  final String message;

  const WatchlistMovieError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistMovieLoaded extends WatchlistMovieState {
  final List<Movie> watchlistMovies;

  const WatchlistMovieLoaded(this.watchlistMovies);

  @override
  List<Object> get props => [watchlistMovies];
}
