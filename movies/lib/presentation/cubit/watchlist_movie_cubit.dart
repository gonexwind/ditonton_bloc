import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/usecases/get_watchlist_movies.dart';

part 'watchlist_movie_state.dart';

class WatchlistMovieCubit extends Cubit<WatchlistMovieState> {
  final GetWatchlistMovies getWatchlistMovies;

  WatchlistMovieCubit(this.getWatchlistMovies) : super(WatchlistMovieInitial());

  Future<void> getWatchListData() async {
    emit(WatchlistMovieLoading());

    final result = await getWatchlistMovies.execute();

    result.fold((failure) {
      emit(WatchlistMovieError(failure.message));
    }, (result) {
      emit(WatchlistMovieLoaded(result));
    });
  }
}
