import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';

part 'watchlist_tv_series_state.dart';

class WatchlistTVSeriesCubit extends Cubit<WatchlistTVSeriesState> {
  final GetWatchlistTVSeries getWatchlistTVSeries;

  WatchlistTVSeriesCubit({required this.getWatchlistTVSeries})
      : super(WatchlistTVInitial());

  Future<void> getWatchListData() async {
    emit(WatchlistTVLoading());

    final watchlistTVSeries = await getWatchlistTVSeries.execute();

    watchlistTVSeries.fold((failure) {
      emit(WatchlistTVError(failure.message));
    }, (result) {
      emit(WatchlistTVLoaded(result));
    });
  }
}
