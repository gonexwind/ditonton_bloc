part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  const MovieDetailState();

  @override
  List<Object> get props => [];
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  final String message;
  final bool isAddedtoWatchlist;

  const MovieDetailSuccess(this.message, this.isAddedtoWatchlist);

  @override
  List<Object> get props => [message, isAddedtoWatchlist];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  const MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieData;
  final bool isAddedtoWatchlist;
  final List<Movie> movieRecommendations;

  const MovieDetailLoaded(
    this.movieData,
    this.isAddedtoWatchlist,
    this.movieRecommendations,
  );

  @override
  List<Object> get props => [movieData, isAddedtoWatchlist, movieRecommendations];
}
