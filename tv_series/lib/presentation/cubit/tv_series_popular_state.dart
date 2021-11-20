part of 'tv_series_popular_cubit.dart';

abstract class TVSeriesPopularState extends Equatable {
  const TVSeriesPopularState();

  @override
  List<Object> get props => [];
}

class TVSeriesPopularInitialState extends TVSeriesPopularState {
  const TVSeriesPopularInitialState();
}

class TVSeriesPopularLoadingState extends TVSeriesPopularState {
  const TVSeriesPopularLoadingState();
}

class TVSeriesPopularErrorState extends TVSeriesPopularState {
  const TVSeriesPopularErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  TVSeriesPopularErrorState copyWith({
    String? message,
  }) {
    return TVSeriesPopularErrorState(
      message ?? this.message,
    );
  }
}

class TVSeriesPopularLoadedState extends TVSeriesPopularState {
  const TVSeriesPopularLoadedState({
    required this.items,
  });

  final List<TV> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  TVSeriesPopularLoadedState copyWith({
    List<TV>? items,
  }) {
    return TVSeriesPopularLoadedState(
      items: items ?? this.items,
    );
  }
}
