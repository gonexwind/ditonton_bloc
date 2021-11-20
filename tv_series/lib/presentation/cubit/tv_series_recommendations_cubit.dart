import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_recommendation_tv_series.dart';

part 'tv_series_recommendations_state.dart';

class TVSeriesRecommendationsCubit extends Cubit<TVSeriesRecommendationsState> {
  TVSeriesRecommendationsCubit({
    required this.getRecommendationTVSeries,
  }) : super(const TVSeriesRecommendationsInitialState());

  final GetRecommendationTVSeries getRecommendationTVSeries;

  Future<void> get(int id) async {
    emit(const TVSeriesRecommendationsLoadingState());

    final result = await getRecommendationTVSeries.execute(id);
    result.fold(
      (failure) => emit(TVSeriesRecommendationsErrorState(failure.message)),
      (values) => emit(TVSeriesRecommendationsLoadedState(items: values)),
    );
  }
}
