import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tSeasonModelJson = {
    'air_date': DateTime.utc(1969, 7, 20, 20, 18, 04).toIso8601String(),
    'episode_count': 12,
    'id': 1,
    'name': 'name',
    'overview': 'overview',
    'poster_path': 'posterPath',
    'season_number': 1,
  };

  var tSeasonModel = SeasonModel(
    airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    episodeCount: 12,
    id: 1,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 1,
  );

  var tSeason = Season(
    airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    episodeCount: 12,
    id: 1,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 1,
  );

  test('should be a subclass of Season entity', () async {
    final result = tSeasonModel.toEntity();
    expect(result, tSeason);
  });

  test('should return SeasonModel object from json', () {
    final result = SeasonModel.fromJson(tSeasonModelJson);
    expect(result, tSeasonModel);
  });

  test('should return json object from SeasonModel', () {
    final result = tSeasonModel.toJson();
    expect(result, tSeasonModelJson);
  });
}
