import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
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
}
