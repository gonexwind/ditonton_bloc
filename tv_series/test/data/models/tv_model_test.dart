import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
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
}
