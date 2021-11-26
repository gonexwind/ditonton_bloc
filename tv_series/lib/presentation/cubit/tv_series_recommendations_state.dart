part of 'tv_series_recommendations_cubit.dart';

abstract class TVSeriesRecommendationsState extends Equatable {
  const TVSeriesRecommendationsState();

  @override
  List<Object> get props => [];
}

class TVSeriesRecommendationsInitialState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsInitialState();
}

class TVSeriesRecommendationsLoadingState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsLoadingState();
}

class TVSeriesRecommendationsErrorState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  TVSeriesRecommendationsErrorState copyWith({
    String? message,
  }) {
    return TVSeriesRecommendationsErrorState(
      message ?? this.message,
    );
  }
}

class TVSeriesRecommendationsLoadedState extends TVSeriesRecommendationsState {
  const TVSeriesRecommendationsLoadedState({
    required this.items,
  });

  final List<TV> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;
}
