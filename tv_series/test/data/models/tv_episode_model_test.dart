import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
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
}
