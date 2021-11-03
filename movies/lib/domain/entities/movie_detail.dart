import 'package:equatable/equatable.dart';

import 'genre.dart';

class MovieDetail extends Equatable {
  const MovieDetail({
    this.adult = false,
    this.backdropPath,
    this.genres = const [],
    this.id = 0,
    this.originalTitle ='',
    this.overview = '',
    this.posterPath ='',
    this.releaseDate = '',
    this.runtime = 0,
    this.title = '',
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  final bool adult;
  final String? backdropPath;
  final List<Genre> genres;
  final int id;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        id,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        title,
        voteAverage,
        voteCount,
      ];
}
