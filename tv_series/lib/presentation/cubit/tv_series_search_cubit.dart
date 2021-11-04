import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tv_series_search_state.dart';

class TvSeriesSearchCubit extends Cubit<TvSeriesSearchState> {
  TvSeriesSearchCubit() : super(TvSeriesSearchInitial());
}
