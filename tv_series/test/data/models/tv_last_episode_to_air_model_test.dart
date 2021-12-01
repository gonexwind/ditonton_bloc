import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
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
}
