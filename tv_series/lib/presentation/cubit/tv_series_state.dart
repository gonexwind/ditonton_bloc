part of 'tv_series_cubit.dart';

abstract class TVSeriesState extends Equatable {
  const TVSeriesState();

  @override
  List<Object> get props => [];
}

class TVSeriesInitial extends TVSeriesState {}

class TVSeriesLoading extends TVSeriesState {}

class TVSeriesError extends TVSeriesState {
  final String message;

  const TVSeriesError(this.message);

  @override
  List<Object> get props => [message];
}

class TvSeriesLoaded extends TVSeriesState {
  final List<TV> onAirSeries;
  final List<TV> popularSeries;
  final List<TV> topRatedSeries;

  const TvSeriesLoaded(this.onAirSeries, this.popularSeries, this.topRatedSeries);

  @override
  List<Object> get props => [onAirSeries, popularSeries, topRatedSeries];
}

class TVSeriesPopularLoaded extends TVSeriesState {
  final List<TV> popularSeries;

  const TVSeriesPopularLoaded(this.popularSeries);

  @override
  List<Object> get props => [popularSeries];
}

class TVSeriesTopRatedLoaded extends TVSeriesState {
  final List<TV> topRatedSeries;

  const TVSeriesTopRatedLoaded(this.topRatedSeries);

  @override
  List<Object> get props => [topRatedSeries];
}
