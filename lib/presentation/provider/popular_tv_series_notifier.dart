import 'package:ditonton/utils/state_enum.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv_series.dart';
import 'package:flutter/foundation.dart';

class PopularTVSeriesNotifier extends ChangeNotifier {
  final GetPopularTVSeries getPopularTVSeries;

  PopularTVSeriesNotifier(this.getPopularTVSeries);

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TV> _tvSeries = [];
  List<TV> get tvSeries => _tvSeries;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularTVSeries() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularTVSeries.execute();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (tvSeriesData) {
        _tvSeries = tvSeriesData;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
