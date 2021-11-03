import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_airing_today_tv_series.dart';
import 'package:tv_series/domain/usecases/get_popular_tv_series.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';

part 'tv_series_state.dart';

class TVSeriesCubit extends Cubit<TVSeriesState> {
  final GetAiringTodayTVSeries getAiringTodayTvSeries;
  final GetPopularTVSeries getPopularTvSeries;
  final GetTopRatedTVSeries getTopRatedTvSeries;

  TVSeriesCubit({
    required this.getAiringTodayTvSeries,
    required this.getPopularTvSeries,
    required this.getTopRatedTvSeries,
  }) : super(TVSeriesInitial());

  Future<void> loadData() async {
    try {
      emit(TVSeriesLoading());
      late List<TV> airingTodaySeries;
      late List<TV> popularSeries;
      late List<TV> topRatedSeries;

      final onAir = await getAiringTodayTvSeries.execute();
      onAir.fold(
        (failure) {
          return;
        },
        (result) {
          airingTodaySeries = result;
        },
      );

      final popular = await getPopularTvSeries.execute();
      popular.fold(
        (failure) {
          return;
        },
        (result) {
          popularSeries = result;
        },
      );

      final topRated = await getTopRatedTvSeries.execute();
      topRated.fold(
        (failure) {
          return;
        },
        (result) {
          topRatedSeries = result;
        },
      );

      emit(TvSeriesLoaded(airingTodaySeries, popularSeries, topRatedSeries));
    } catch (e) {
      emit(TVSeriesError(e.toString()));
    }
  }

  Future<void> loadPopular() async {
    try {
      emit(TVSeriesLoading());
      late List<TV> popularSeries;

      final popular = await getPopularTvSeries.execute();
      popular.fold(
        (failure) {
          return;
        },
        (result) {
          popularSeries = result;
        },
      );

      emit(TVSeriesPopularLoaded(popularSeries));
    } catch (e) {
      emit(TVSeriesError(e.toString()));
    }
  }

  Future<void> loadTopRated() async {
    try {
      emit(TVSeriesLoading());
      late List<TV> topRatedSeries;

      final topRated = await getTopRatedTvSeries.execute();
      topRated.fold(
        (failure) {
          return;
        },
        (result) {
          topRatedSeries = result;
        },
      );

      emit(TVSeriesTopRatedLoaded(topRatedSeries));
    } catch (e) {
      emit(TVSeriesError(e.toString()));
    }
  }
}
