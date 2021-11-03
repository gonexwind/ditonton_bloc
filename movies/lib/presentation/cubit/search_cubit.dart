import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/search_movies.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchMovies searchMovies;

  SearchCubit(this.searchMovies) : super(SearchEmpty());

  Future<void> searchMovieData(String query) async {
    emit(SearchLoading());

    final result = await searchMovies.execute(query);

    result.fold((failure) {
      emit(SearchError(failure.message));
    }, (data) {
      emit(SearchHasData(data));
    });
  }
}
