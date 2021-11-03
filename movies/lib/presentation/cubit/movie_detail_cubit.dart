import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/domain/entities/movie.dart';
import 'package:movies/domain/entities/movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_detail.dart';
import 'package:movies/domain/usecases/get_movie_recommendations.dart';
import 'package:movies/domain/usecases/get_watchlist_status.dart';
import 'package:movies/domain/usecases/remove_watchlist.dart';
import 'package:movies/domain/usecases/save_watchlist.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetWatchListStatus watchListStatus;
  final GetMovieRecommendations getMovieRecommendations;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieDetailCubit({
    required this.getMovieDetail,
    required this.watchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
    required this.getMovieRecommendations,
  }) : super(MovieDetailInitial());

  Future<void> fetchMovieDetail(int id) async {
    emit(MovieDetailLoading());

    final detailData = await getMovieDetail.execute(id);
    final isBookmarked = await watchListStatus.execute(id);
    // final recommendationResult = await getMovieRecommendations.execute(id);

    detailData.fold(
      (failure) {
        emit(MovieDetailError(failure.message));
      },
      (data) {
        emit(MovieDetailLoaded(data, isBookmarked));
      },
    );
  }

  Future<void> saveToWatchlist(MovieDetail movieDetail) async {
    emit(MovieDetailLoading());

    final result = await saveWatchlist.execute(movieDetail);

    result.fold(
      (failure) {
        emit(MovieDetailError(failure.message));
      },
      (result) {
        emit(MovieDetailSuccess(result, true));
      },
    );
  }

  Future<void> removeFromWatchlist(MovieDetail movieDetail) async {
    emit(MovieDetailLoading());

    final result = await removeWatchlist.execute(movieDetail);

    result.fold(
      (failure) {
        emit(MovieDetailError(failure.message));
      },
      (result) {
        emit(MovieDetailSuccess(result, false));
      },
    );
  }
}
