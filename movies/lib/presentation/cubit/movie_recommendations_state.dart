part of 'movie_recommendations_cubit.dart';

abstract class MovieRecommendationsState extends Equatable {
  const MovieRecommendationsState();

  @override
  List<Object> get props => [];
}

class MovieRecommendationsInitialState extends MovieRecommendationsState {
  const MovieRecommendationsInitialState();
}

class MovieRecommendationsLoadingState extends MovieRecommendationsState {
  const MovieRecommendationsLoadingState();
}

class MovieRecommendationsErrorState extends MovieRecommendationsState {
  const MovieRecommendationsErrorState(
      this.message,
      );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  MovieRecommendationsErrorState copyWith({
    String? message,
  }) {
    return MovieRecommendationsErrorState(
      message ?? this.message,
    );
  }
}

class MovieRecommendationsLoadedState extends MovieRecommendationsState {
  const MovieRecommendationsLoadedState({
    required this.items,
  });

  final List<Movie> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  MovieRecommendationsLoadedState copyWith({
    List<Movie>? items,
  }) {
    return MovieRecommendationsLoadedState(
      items: items ?? this.items,
    );
  }
}
