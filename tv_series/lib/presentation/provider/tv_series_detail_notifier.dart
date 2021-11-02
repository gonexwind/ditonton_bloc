import 'package:core/utils/state_enum.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/usecases/get_detail_tv_series.dart';
import 'package:tv_series/domain/usecases/get_recommendation_tv_series.dart';
import 'package:tv_series/domain/usecases/get_watch_list_status_tv_series.dart';
import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';
import 'package:tv_series/domain/usecases/save_watchlist_tv_series.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TVSeriesDetailNotifier extends ChangeNotifier {
  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetDetailTVSeries getDetailTVSeries;
  final GetRecommendationTVSeries getRecommendationTVSeries;
  final GetWatchListStatusTVSeries getWatchListStatusTVSeries;
  final SaveWatchlistTVSeries saveWatchlistTVSeries;
  final RemoveWatchlistTVSeries removeWatchlistTVSeries;

  TVSeriesDetailNotifier({
    required this.getDetailTVSeries,
    required this.getRecommendationTVSeries,
    required this.getWatchListStatusTVSeries,
    required this.saveWatchlistTVSeries,
    required this.removeWatchlistTVSeries,
  });

  late TVDetail _tvSeries;
  TVDetail get tvSeries => _tvSeries;

  RequestState _tvSeriesState = RequestState.Empty;
  RequestState get tvSeriesState => _tvSeriesState;

  List<TV> _tvSeriesRecommendations = [];
  List<TV> get tvSeriesRecommendations => _tvSeriesRecommendations;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlistTVSeries = false;
  bool get isAddedToWatchlistTVSeries => _isAddedtoWatchlistTVSeries;

  Future<void> fetchTVSeriesDetail(int id) async {
    _tvSeriesState = RequestState.Loading;
    notifyListeners();
    final detailResult = await getDetailTVSeries.execute(id);
    final recommendationResult = await getRecommendationTVSeries.execute(id);
    detailResult.fold(
      (failure) {
        _tvSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeries) {
        _recommendationState = RequestState.Loading;
        _tvSeries = tvSeries;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (tvSeriess) {
            _recommendationState = RequestState.Loaded;
            _tvSeriesRecommendations = tvSeriess;
          },
        );
        _tvSeriesState = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> addWatchlistTVSeries(TVDetail tvSeries) async {
    final result = await saveWatchlistTVSeries.execute(tvSeries);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistTVSeriesStatus(tvSeries.id);
  }

  Future<void> removeFromWatchlistTVSeries(TVDetail tvSeries) async {
    final result = await removeWatchlistTVSeries.execute(tvSeries);

    await result.fold(
      (failure) async {
        _watchlistMessage = failure.message;
      },
      (successMessage) async {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistTVSeriesStatus(tvSeries.id);
  }

  Future<void> loadWatchlistTVSeriesStatus(int id) async {
    final result = await getWatchListStatusTVSeries.execute(id);
    _isAddedtoWatchlistTVSeries = result;
    notifyListeners();
  }
}
