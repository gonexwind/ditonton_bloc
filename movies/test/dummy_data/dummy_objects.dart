import 'dart:convert';

import 'package:movies/movies.dart';
import 'package:tv_series/tv_series.dart';

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
  backdropPath: '/sWvxBXNtCOaGdtpKNLiOqmwb10N.jpg',
  genres: [Genre(id: 14, name: 'Fantasy'), Genre(id: 28, name: 'Action')],
  id: 557,
  originalTitle: 'Spider-Man',
  overview: 'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  posterPath: '/gSZyYEK5AfZuOFFjnVPUCLvdOD6.jpg',
  releaseDate: '2002-05-01',
  runtime: 121,
  title: 'Spider-Man',
  voteAverage: 7.2,
  voteCount: 14360,
);

final testMovieDetails = MovieDetail(
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

final tMovieModel = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
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
final tMovieList = <Movie>[tMovieModel];
const tQuery = 'spiderman';

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
