part of 'tv_series_top_rated_cubit.dart';

abstract class TVSeriesTopRatedState extends Equatable {
  const TVSeriesTopRatedState();

  @override
  List<Object> get props => [];
}

class TVSeriesTopRatedInitialState extends TVSeriesTopRatedState {
  const TVSeriesTopRatedInitialState();
}

class TVSeriesTopRatedLoadingState extends TVSeriesTopRatedState {
  const TVSeriesTopRatedLoadingState();
}

class TVSeriesTopRatedErrorState extends TVSeriesTopRatedState {
  const TVSeriesTopRatedErrorState(
    this.message,
  );

  final String message;

  @override
  List<Object> get props => [message];

  @override
  bool get stringify => true;

  TVSeriesTopRatedErrorState copyWith({
    String? message,
  }) {
    return TVSeriesTopRatedErrorState(
      message ?? this.message,
    );
  }
}

class TVSeriesTopRatedLoadedState extends TVSeriesTopRatedState {
  const TVSeriesTopRatedLoadedState({
    required this.items,
  });

  final List<TV> items;

  @override
  List<Object> get props => [items];

  @override
  bool get stringify => true;

  TVSeriesTopRatedLoadedState copyWith({
    List<TV>? items,
  }) {
    return TVSeriesTopRatedLoadedState(
      items: items ?? this.items,
    );
  }
}
