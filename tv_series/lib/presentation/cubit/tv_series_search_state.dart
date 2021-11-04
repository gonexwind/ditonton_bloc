part of 'tv_series_search_cubit.dart';

abstract class TVSeriesSearchState extends Equatable {
  const TVSeriesSearchState();

  @override
  List<Object> get props => [];
}

class TVSeriesSearchInitial extends TVSeriesSearchState {}

class TVSeriesSearchLoading extends TVSeriesSearchState {}

class TVSeriesSearchError extends TVSeriesSearchState {
  final String message;

  const TVSeriesSearchError(this.message);

  @override
  List<Object> get props => [message];
}

class TVSeriesSearchLoaded extends TVSeriesSearchState {
  final List<TV> result;

  const TVSeriesSearchLoaded(this.result);

  @override
  List<Object> get props => [result];
}
