part of 'movie_now_playing_cubit.dart';

abstract class MovieNowPlayingState extends Equatable {
  const MovieNowPlayingState();
  @override
  List<Object> get props => [];
}

class MovieNowPlayingInitialState extends MovieNowPlayingState {
  const MovieNowPlayingInitialState();
}

class MovieNowPlayingLoadingState extends MovieNowPlayingState {
  const MovieNowPlayingLoadingState();
}

class MovieNowPlayingErrorState extends MovieNowPlayingState {
  const MovieNowPlayingErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  MovieNowPlayingErrorState copyWith({
    String? message,
  }) {
    return MovieNowPlayingErrorState(
      message ?? this.message,
    );
  }
}

class MovieNowPlayingLoadedState extends MovieNowPlayingState {
  const MovieNowPlayingLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  MovieNowPlayingLoadedState copyWith({
    List<Movie>? items,
  }) {
    return MovieNowPlayingLoadedState(
      items: items ?? this.items,
    );
  }
}
