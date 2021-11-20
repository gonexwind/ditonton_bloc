import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/tv.dart';
import '../../../domain/usecases/get_top_rated_tv_series.dart';

part 'tv_series_top_rated_state.dart';

class TVSeriesTopRatedCubit extends Cubit<TVSeriesTopRatedState> {
  TVSeriesTopRatedCubit({
    required this.getTopRatedTVSeries,
  }) : super(const TVSeriesTopRatedInitialState());

  final GetTopRatedTVSeries getTopRatedTVSeries;

  Future<void> get() async {
    emit(const TVSeriesTopRatedLoadingState());
    final result = await getTopRatedTVSeries.execute();
    result.fold(
      (failure) => emit(TVSeriesTopRatedErrorState(failure.message)),
      (values) => emit(TVSeriesTopRatedLoadedState(items: values)),
    );
  }
}
