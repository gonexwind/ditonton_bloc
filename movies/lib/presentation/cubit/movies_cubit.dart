import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/movies.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MoviesCubit({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
    required this.getTopRatedMovies,
  }) : super(MoviesInitial());

  Future<void> fetchMovies() async {
    try {
      emit(MoviesLoading());

      late List<Movie> nowPlayingMovies;
      late List<Movie> popularMovies;
      late List<Movie> topRatedMovies;

      final onAir = await getNowPlayingMovies.execute();
      onAir.fold(
        (failure) {
          return;
        },
        (movie) {
          nowPlayingMovies = movie;
        },
      );

      final popular = await getPopularMovies.execute();
      popular.fold(
        (failure) {
          return;
        },
        (movie) {
          popularMovies = movie;
        },
      );

      final topRated = await getTopRatedMovies.execute();
      topRated.fold(
        (failure) {
          return;
        },
        (movie) {
          topRatedMovies = movie;
        },
      );

      emit(MoviesLoaded(nowPlayingMovies, popularMovies, topRatedMovies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  Future<void> fetchPopularMovies() async {
    try {
      emit(MoviesLoading());
      late List<Movie> popularMovies;

      final popular = await getPopularMovies.execute();
      popular.fold(
        (failure) {
          return;
        },
        (movie) {
          popularMovies = movie;
        },
      );

      emit(MoviesPopularLoaded(popularMovies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }

  Future<void> fetchTopRatedMovies() async {
    try {
      emit(MoviesLoading());
      late List<Movie> topRatedMovies;

      final topRated = await getTopRatedMovies.execute();
      topRated.fold(
        (failure) {
          return;
        },
        (movie) {
          topRatedMovies = movie;
        },
      );

      emit(MoviesTopRatedLoaded(topRatedMovies));
    } catch (e) {
      emit(MoviesError(e.toString()));
    }
  }
}
