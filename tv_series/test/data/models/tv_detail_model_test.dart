import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tTVDetailResponseJson = {
    "backdrop_path": 'backdropPath',
    "episode_run_time": [1],
    "first_air_date": DateTime.utc(1969, 7, 20, 20, 18, 04).toIso8601String(),
    "homepage": 'homepage',
    "id": 1,
    "in_production": false,
    "languages": ['en'],
    "last_air_date": DateTime.utc(1969, 7, 20, 20, 18, 04).toIso8601String(),
    "name": 'name',
    "next_episode_to_air": {'episode': 12},
    "number_of_episodes": 12,
    "number_of_seasons": 2,
    "origin_country": ['USA'],
    "original_language": 'originalLanguage',
    "original_name": 'originalName',
    "overview": 'overview',
    "popularity": 5.6,
    "poster_path": 'posterPath',
    "status": 'status',
    "tagline": 'tagline',
    "type": 'type',
    "vote_average": 4.5,
    "vote_count": 4,
    "created_by": [],
    "genres": [],
    "last_episode_to_air": {
      "air_date": DateTime.utc(1969, 7, 20, 20, 18, 04).toIso8601String(),
      "episode_number": 2,
      "id": 1,
      "name": 'name',
      "overview": 'overview',
      "production_code": 'productionCode',
      "season_number": 1,
      "still_path": 'stillPath',
      "vote_average": 2.2,
      "vote_count": 2,
    },
    "networks": [],
    "production_companies": [],
    "production_countries": [],
    "seasons": [],
    "spoken_languages": [],
  };

  var tTVDetailResponse = TVDetailResponse(
    backdropPath: 'backdropPath',
    episodeRunTime: [1],
    firstAirDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    homepage: 'homepage',
    id: 1,
    inProduction: false,
    languages: ['en'],
    lastAirDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    name: 'name',
    nextEpisodeToAir: {'episode': 12},
    numberOfEpisodes: 12,
    numberOfSeasons: 2,
    originCountry: ['USA'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 5.6,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 4.5,
    voteCount: 4,
    createdBy: [],
    genres: [],
    lastEpisodeToAir: LastEpisodeToAirModel(
      airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
      episodeNumber: 2,
      id: 1,
      name: 'name',
      overview: 'overview',
      productionCode: 'productionCode',
      seasonNumber: 1,
      stillPath: 'stillPath',
      voteAverage: 2.2,
      voteCount: 2,
    ),
    networks: [],
    productionCompanies: [],
    productionCountries: [],
    seasons: [],
    spokenLanguages: [],
  );

  var tTVDetail = TVDetail(
    backdropPath: 'backdropPath',
    episodeRunTime: [1],
    firstAirDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    homepage: 'homepage',
    id: 1,
    inProduction: false,
    languages: ['en'],
    lastAirDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    name: 'name',
    nextEpisodeToAir: {'episode': 12},
    numberOfEpisodes: 12,
    numberOfSeasons: 2,
    originCountry: ['USA'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 5.6,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 4.5,
    voteCount: 4,
    createdBy: [],
    genres: [],
    lastEpisodeToAir: LastEpisodeToAir(
      airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
      episodeNumber: 2,
      id: 1,
      name: 'name',
      overview: 'overview',
      productionCode: 'productionCode',
      seasonNumber: 1,
      stillPath: 'stillPath',
      voteAverage: 2.2,
      voteCount: 2,
    ),
    networks: [],
    productionCompanies: [],
    productionCountries: [],
    seasons: [],
    spokenLanguages: [],
  );

  test('should be a subclass of TVDetail entity', () async {
    final result = tTVDetailResponse.toEntity();
    expect(result, tTVDetail);
  });

  test('should return TVDetailResponse object from json', () {
    final result = TVDetailResponse.fromJson(tTVDetailResponseJson);
    expect(result, tTVDetailResponse);
  });
}
