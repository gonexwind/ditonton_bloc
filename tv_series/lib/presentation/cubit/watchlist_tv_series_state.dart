part of 'watchlist_tv_series_cubit.dart';

abstract class WatchlistTVSeriesState extends Equatable {
  const WatchlistTVSeriesState();

  @override
  List<Object> get props => [];
}

class WatchlistTVInitial extends WatchlistTVSeriesState {}

class WatchlistTVLoading extends WatchlistTVSeriesState {}

class WatchlistTVError extends WatchlistTVSeriesState {
  final String message;

  const WatchlistTVError(this.message);

  @override
  List<Object> get props => [message];
}

class WatchlistTVLoaded extends WatchlistTVSeriesState {
  final List<TV> watchlistTVSeries;

  const WatchlistTVLoaded(this.watchlistTVSeries);

  @override
  List<Object> get props => [watchlistTVSeries];
}
