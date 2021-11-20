import 'dart:developer';

import 'package:core/core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv_detail.dart';
import '../../../domain/usecases/get_detail_tv_series.dart';
import '../../../domain/usecases/get_watch_list_status_tv_series.dart';
import '../../../domain/usecases/remove_watchlist_tv_series.dart';
import '../../../domain/usecases/save_watchlist_tv_series.dart';

part 'tv_series_detail_state.dart';

class TVSeriesDetailCubit extends Cubit<TVSeriesDetailState> {
  TVSeriesDetailCubit({
    required this.getDetailTVSeries,
    required this.getWatchListStatusTVSeries,
    required this.saveWatchlistTVSeries,
    required this.removeWatchlistTVSeries,
  }) : super(const TVSeriesDetailState());

  final GetDetailTVSeries getDetailTVSeries;
  final GetWatchListStatusTVSeries getWatchListStatusTVSeries;
  final SaveWatchlistTVSeries saveWatchlistTVSeries;
  final RemoveWatchlistTVSeries removeWatchlistTVSeries;

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  Future<void> get(int id) async {
    emit(state.setRequestState(RequestState.Loading));
    final result = await getDetailTVSeries.execute(id);
    result.fold(
          (failure) {
        emit(state.setRequestState(RequestState.Error));
        emit(state.setMessage(failure.message));
      },
          (value) {
        emit(state.setRequestState(RequestState.Loaded));
        emit(state.setTV(value));
      },
    );
  }

  Future<void> saveWatchlist(TVDetail tv) async {
    final result = await saveWatchlistTVSeries.execute(tv);
    result.fold(
          (failure) => emit(state.setMessageWatchlist(failure.message)),
          (value) => emit(state.setMessageWatchlist(value)),
    );

    await getWatchlistStatus(tv.id);
  }

  Future<void> removeWatchlist(TVDetail tv) async {
    final result = await removeWatchlistTVSeries.execute(tv);
    result.fold(
          (failure) => emit(state.setMessageWatchlist(failure.message)),
          (value) {
        log('message success remove watchlist $value');
        emit(state.setMessageWatchlist(value));
      },
    );

    await getWatchlistStatus(tv.id);
  }

  Future<void> getWatchlistStatus(int id) async {
    final result = await getWatchListStatusTVSeries.execute(id);
    emit(state.setAddedToWatchlist(result));
  }
}
