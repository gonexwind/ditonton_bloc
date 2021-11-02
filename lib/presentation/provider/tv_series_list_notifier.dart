import 'package:ditonton/utils/state_enum.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_airing_today_tv_series.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv_series.dart';
import 'package:ditonton/domain/usecases/tv/get_top_rated_tv_series.dart';
import 'package:flutter/material.dart';

class TVSeriesListNotifier extends ChangeNotifier {
  var _airingTodayTVSeries = <TV>[];
  List<TV> get airingTodayTVSeries => _airingTodayTVSeries;

  RequestState _airingTodayTVSeriesState = RequestState.Empty;
  RequestState get airingTodayTVSeriesState => _airingTodayTVSeriesState;

  var _popularTVSeries = <TV>[];
  List<TV> get popularTVSeries => _popularTVSeries;

  RequestState _popularTVSeriesState = RequestState.Empty;
  RequestState get popularTVSeriesState => _popularTVSeriesState;

  var _topRatedTVSeries = <TV>[];
  List<TV> get topRatedTVSeries => _topRatedTVSeries;

  RequestState _topRatedTVSeriesState = RequestState.Empty;
  RequestState get topRatedTVSeriesState => _topRatedTVSeriesState;

  String _message = '';
  String get message => _message;

  TVSeriesListNotifier({
    required this.getAiringTodayTVSeries,
    required this.getPopularTVSeries,
    required this.getTopRatedTVSeries,
  });

  final GetAiringTodayTVSeries getAiringTodayTVSeries;
  final GetPopularTVSeries getPopularTVSeries;
  final GetTopRatedTVSeries getTopRatedTVSeries;

  Future<void> fetchNowPlayingTVSeries() async {
    _airingTodayTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getAiringTodayTVSeries.execute();
    result.fold(
      (failure) {
        _airingTodayTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _airingTodayTVSeriesState = RequestState.Loaded;
        _airingTodayTVSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularTVSeries() async {
    _popularTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVSeries.execute();
    result.fold(
      (failure) {
        _popularTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _popularTVSeriesState = RequestState.Loaded;
        _popularTVSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedTVSeries() async {
    _topRatedTVSeriesState = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedTVSeries.execute();
    result.fold(
      (failure) {
        _topRatedTVSeriesState = RequestState.Error;
        _message = failure.message;
        notifyListeners();
      },
      (tvSeriesData) {
        _topRatedTVSeriesState = RequestState.Loaded;
        _topRatedTVSeries = tvSeriesData;
        notifyListeners();
      },
    );
  }
}
