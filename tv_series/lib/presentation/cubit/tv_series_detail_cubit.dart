import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_detail_state.dart';

class TVSeriesDetailCubit extends Cubit<TVSeriesDetailState> {
  final GetDetailTVSeries getDetailTVSeries;
  final GetWatchListStatusTVSeries getWatchListStatusTVSeries;
  final GetRecommendationTVSeries getRecommendationTVSeries;
  final SaveWatchlistTVSeries saveWatchlistTVSeries;
  final RemoveWatchlistTVSeries removeWatchlistTVSeries;

  TVSeriesDetailCubit({
    required this.getDetailTVSeries,
    required this.getRecommendationTVSeries,
    required this.getWatchListStatusTVSeries,
    required this.saveWatchlistTVSeries,
    required this.removeWatchlistTVSeries,
  }) : super(TVSeriesDetailInitial());

  Future<void> fetchTVSeriesDetail(int id) async {
    emit(TVSeriesDetailLoading());

    final detailData = await getDetailTVSeries.execute(id);
    final isAddedtoWatchlistTVSeries =
        await getWatchListStatusTVSeries.execute(id);
    final recommendationResult = await getRecommendationTVSeries.execute(id);

    detailData.fold((failure) {
      emit(TVSeriesDetailError(failure.message));
    }, (data) {
      recommendationResult.fold(
        (failure) {
          emit(TVSeriesDetailError(failure.message));
        },
        (recomendations) {
          emit(TVSeriesDetailLoaded(
              data, isAddedtoWatchlistTVSeries, recomendations));
        },
      );
    });
  }

  Future<void> addWatchlistTVSeries(TVDetail data) async {
    emit(TVSeriesDetailLoading());

    final result = await saveWatchlistTVSeries.execute(data);

    result.fold((failure) {
      emit(TVSeriesDetailError(failure.message));
    }, (result) {
      emit(TVSeriesDetailSuccess(result, true));
    });
  }

  Future<void> removeFromWatchlistTVSeries(TVDetail data) async {
    emit(TVSeriesDetailLoading());

    final result = await removeWatchlistTVSeries.execute(data);

    result.fold((failure) {
      emit(TVSeriesDetailError(failure.message));
    }, (result) {
      emit(TVSeriesDetailSuccess(result, false));
    });
  }
}
