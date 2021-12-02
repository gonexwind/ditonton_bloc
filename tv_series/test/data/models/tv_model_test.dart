import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  const tTVModelJson = {
    "backdrop_path": 'backdropPath',
    "first_air_date": '2010-06-08',
    "genre_ids": [1],
    "id": 1,
    "name": 'name',
    "origin_country": ['US'],
    "original_language": 'originalLanguage',
    "original_name": 'originalName',
    "overview": 'overview',
    "popularity": 8.0,
    "poster_path": 'posterPath',
    "vote_average": 6.0,
    "vote_count": 2,
  };

  const tTVModel = TVModel(
    backdropPath: 'backdropPath',
    firstAirDate: '2010-06-08',
    genreIds: [1],
    id: 1,
    name: 'name',
    originCountry: ['US'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 8.0,
    posterPath: 'posterPath',
    voteAverage: 6.0,
    voteCount: 2,
  );

  const tTV = TV(
    backdropPath: 'backdropPath',
    firstAirDate: '2010-06-08',
    genreIds: [1],
    id: 1,
    name: 'name',
    originCountry: ['US'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 8.0,
    posterPath: 'posterPath',
    voteAverage: 6.0,
    voteCount: 2,
  );

  test('should be a subclass of TV entity', () async {
    final result = tTVModel.toEntity();
    expect(result, tTV);
  });

  test('should return TVModel object from json', () {
    final result = TVModel.fromJson(tTVModelJson);
    expect(result, tTVModel);
  });

  test('should return json object from TVModel', () {
    final result = tTVModel.toJson();
    expect(result, tTVModelJson);
  });
}
