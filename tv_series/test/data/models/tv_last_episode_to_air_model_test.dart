import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tLastEpisodeToAirModelJson = {
    "air_date": DateTime.utc(1969, 7, 20, 20, 18, 04).toIso8601String(),
    "episode_number": 12,
    "id": 1,
    "name": 'name',
    "overview": 'overview',
    "production_code": 'productionCode',
    "season_number": 2,
    "still_path": 'stillPath',
    "vote_average": 4,
    "vote_count": 4,
  };

  var tLastEpisodeToAirModel = LastEpisodeToAirModel(
    airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    episodeNumber: 12,
    id: 1,
    name: 'name',
    overview: 'overview',
    productionCode: 'productionCode',
    seasonNumber: 2,
    stillPath: 'stillPath',
    voteAverage: 4,
    voteCount: 4,
  );

  var tLastEpisodeToAir = LastEpisodeToAir(
    airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    episodeNumber: 12,
    id: 1,
    name: 'name',
    overview: 'overview',
    productionCode: 'productionCode',
    seasonNumber: 2,
    stillPath: 'stillPath',
    voteAverage: 4,
    voteCount: 4,
  );

  test('should be a subclass of LastEpisodeToAir entity', () async {
    final result = tLastEpisodeToAirModel.toEntity();
    expect(result, tLastEpisodeToAir);
  });

  test('should return LastEpisodeToAirModel object from json', () {
    final result = LastEpisodeToAirModel.fromJson(tLastEpisodeToAirModelJson);
    expect(result, tLastEpisodeToAirModel);
  });

  test('should return json object fromt LastEpisodeToAirModel', () {
    final result = tLastEpisodeToAirModel.toJson();
    expect(result, tLastEpisodeToAirModelJson);
  });
}
