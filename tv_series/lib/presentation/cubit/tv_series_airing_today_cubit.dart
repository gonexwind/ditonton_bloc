import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_airing_today_tv_series.dart';

part 'tv_series_airing_today_state.dart';

class TVSeriesAiringTodayCubit extends Cubit<TVSeriesAiringTodayState> {
  TVSeriesAiringTodayCubit({
    required this.getAiringTodayTVSeries,
  }) : super(const TVSeriesAiringTodayInitial());

  final GetAiringTodayTVSeries getAiringTodayTVSeries;

  Future<void> get() async {
    emit(const TVSeriesAiringTodayLoading());
    final result = await getAiringTodayTVSeries.execute();
    result.fold(
      (failure) => emit(TVSeriesAiringTodayError(failure.message)),
      (value) => emit(TVSeriesAiringTodayLoaded(items: value)),
    );
  }
}
