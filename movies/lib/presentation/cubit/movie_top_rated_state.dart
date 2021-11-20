part of 'movie_top_rated_cubit.dart';

abstract class MovieTopRatedState extends Equatable {
  const MovieTopRatedState();

  @override
  List<Object> get props => [];
}

class MovieTopRatedInitialState extends MovieTopRatedState {
  const MovieTopRatedInitialState();
}

class MovieTopRatedLoadingState extends MovieTopRatedState {
  const MovieTopRatedLoadingState();
}

class MovieTopRatedErrorState extends MovieTopRatedState {
  const MovieTopRatedErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  MovieTopRatedErrorState copyWith({
    String? message,
  }) {
    return MovieTopRatedErrorState(
      message ?? this.message,
    );
  }
}

class MovieTopRatedLoadedState extends MovieTopRatedState {
  const MovieTopRatedLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  MovieTopRatedLoadedState copyWith({
    List<Movie>? items,
  }) {
    return MovieTopRatedLoadedState(
      items: items ?? this.items,
    );
  }
}
