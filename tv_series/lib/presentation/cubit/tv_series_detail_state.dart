part of 'tv_series_detail_cubit.dart';

abstract class TVSeriesDetailState extends Equatable {
  const TVSeriesDetailState();

  @override
  List<Object> get props => [];
}

class TVSeriesDetailInitial extends TVSeriesDetailState {}

class TVSeriesDetailLoading extends TVSeriesDetailState {}

class TVSeriesDetailError extends TVSeriesDetailState {
  final String message;

  const TVSeriesDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TVSeriesDetailSuccess extends TVSeriesDetailState {
  final String message;
  final bool isAddedtoWatchlistTVSeries;

  const TVSeriesDetailSuccess(this.message, this.isAddedtoWatchlistTVSeries);

  @override
  List<Object> get props => [message, isAddedtoWatchlistTVSeries];
}

class TVSeriesDetailLoaded extends TVSeriesDetailState {
  final TVDetail tvSeries;
  final bool isAddedtoWatchlistTVSeries;
  final List<TV> recommendationTVSeries;

  const TVSeriesDetailLoaded(this.tvSeries, this.isAddedtoWatchlistTVSeries, this.recommendationTVSeries);

  @override
  List<Object> get props => [tvSeries, isAddedtoWatchlistTVSeries, recommendationTVSeries];
}
