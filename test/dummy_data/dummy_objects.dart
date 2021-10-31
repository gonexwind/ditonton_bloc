import 'dart:convert';

import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/tv/tv_local_database/tv_local_database_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';

import '../json_reader.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTVSeriesTable = TVLocalDatabaseModel(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTVDetail = TVDetail(
  id: 1,
  name: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTVSeriesMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final jsonListAiringTodayTV =
    (jsonDecode(readJson('dummy_data/tv_airing_today.json'))['results'])
        as List;
final jsonListPopularTV =
    (jsonDecode(readJson('dummy_data/tv_popular.json'))['results']) as List;
final jsonListTopRatedTV =
    (jsonDecode(readJson('dummy_data/tv_top_rated.json'))['results']) as List;
final jsonListSearchTV =
    (jsonDecode(readJson('dummy_data/tv_search.json'))['results']) as List;
final jsonListEpisodeSeasonTV =
    (jsonDecode(readJson('dummy_data/tv_episode_season.json'))['episodes'])
        as List;
final jsonListRecommendationTV =
    (jsonDecode(readJson('dummy_data/tv_recommendation.json'))['results'])
        as List;
final jsonDetailTV =
    jsonDecode(readJson('dummy_data/tv_detail.json')) as Map<String, dynamic>;
