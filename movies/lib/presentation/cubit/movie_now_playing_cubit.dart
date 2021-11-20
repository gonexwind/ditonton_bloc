import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_now_playing_movies.dart';

part './movie_now_playing_state.dart';

class MovieNowPlayingCubit extends Cubit<MovieNowPlayingState> {
  MovieNowPlayingCubit({
    required this.getNowPlayingMovies,
  }) : super(const MovieNowPlayingInitialState());

  final GetNowPlayingMovies getNowPlayingMovies;

  Future<void> get() async {
    emit(const MovieNowPlayingLoadingState());

    final result = await getNowPlayingMovies.execute();
    result.fold(
      (failure) => emit(MovieNowPlayingErrorState(failure.message)),
      (values) => emit(MovieNowPlayingLoadedState(items: values)),
    );
  }
}
