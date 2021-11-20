import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';

part './movie_popular_state.dart';

class MoviePopularCubit extends Cubit<MoviePopularState> {
  MoviePopularCubit({
    required this.getPopularMovies,
  }) : super(const MoviePopularInitialState());

  final GetPopularMovies getPopularMovies;
  Future<void> get() async {
    emit(const MoviePopularLoadingState());

    final result = await getPopularMovies.execute();

    result.fold(
          (failure) => emit(MoviePopularErrorState(failure.message)),
          (values) => emit(MoviePopularLoadedState(items: values)),
    );
  }
}
