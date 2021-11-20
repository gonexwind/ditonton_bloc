import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_movie_recommendations.dart';

part './movie_recommendations_state.dart';

class MovieRecommendationsCubit extends Cubit<MovieRecommendationsState> {
  MovieRecommendationsCubit({
    required this.getMovieRecommendations,
  }) : super(const MovieRecommendationsInitialState());
  final GetMovieRecommendations getMovieRecommendations;

  Future<void> get(int id) async {
    emit(const MovieRecommendationsLoadingState());
    final result = await getMovieRecommendations.execute(id);
    result.fold(
          (failure) => emit(MovieRecommendationsErrorState(failure.message)),
          (values) => emit(MovieRecommendationsLoadedState(items: values)),
    );
  }
}
