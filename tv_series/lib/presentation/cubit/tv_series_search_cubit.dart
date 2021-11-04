import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tv_series/tv_series.dart';

part 'tv_series_search_state.dart';

class TVSeriesSearchCubit extends Cubit<TVSeriesSearchState> {
  final SearchTVSeries searchTVSeries;

  TVSeriesSearchCubit({required this.searchTVSeries})
      : super(TVSeriesSearchInitial());

  Future<void> searchTvData(String query) async {
    emit(TVSeriesSearchLoading());

    final dataTv = await searchTVSeries.execute(query);

    dataTv.fold((failure) {
      emit(TVSeriesSearchError(failure.message));
    }, (result) {
      emit(TVSeriesSearchLoaded(result));
    });
  }
}
