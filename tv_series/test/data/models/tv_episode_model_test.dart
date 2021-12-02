import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tEpisodeModelJson = {
    "air_date": DateTime.utc(1969, 7, 20, 20, 18, 04).toIso8601String(),
    "episode_number": 1,
    "crew": [],
    "guest_stars": [],
    "id": 1,
    "name": 'name',
    "overview": 'overview',
    "production_code": 'productionCode',
    "season_number": 2,
    "still_path": 'stillPath',
    "vote_average": 5.4,
    "vote_count": 4,
  };

  var tEpisodeModel = EpisodeModel(
    airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    episodeNumber: 1,
    crew: [],
    guestStars: [],
    id: 1,
    name: 'name',
    overview: 'overview',
    productionCode: 'productionCode',
    seasonNumber: 2,
    stillPath: 'stillPath',
    voteAverage: 5.4,
    voteCount: 4,
  );

  var tEpisode = Episode(
    airDate: DateTime.utc(1969, 7, 20, 20, 18, 04),
    episodeNumber: 1,
    crew: [],
    guestStars: [],
    id: 1,
    name: 'name',
    overview: 'overview',
    productionCode: 'productionCode',
    seasonNumber: 2,
    stillPath: 'stillPath',
    voteAverage: 5.4,
    voteCount: 4,
  );

  test('should be a subclass of Episode entity', () async {
    final result = tEpisodeModel.toEntity();
    expect(result, tEpisode);
  });

  test('should return EpisodeModel object from json', () {
    final result = EpisodeModel.fromJson(tEpisodeModelJson);
    expect(result, tEpisodeModel);
  });

  test('should return json object from EpisodeModel', () {
    final result = tEpisodeModel.toJson();
    expect(result, tEpisodeModelJson);
  });
}
