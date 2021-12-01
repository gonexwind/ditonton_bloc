import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tTVLocalDatabaseModel = TVLocalDatabaseModel(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    title: 'title',
  );

  var tTVLocalDatabase = TV(
    id: 1,
    overview: 'overview',
    posterPath: 'posterPath',
    name: 'title',
  );

  test('should be a subclass of TVLocalDatabase entity', () async {
    final result = tTVLocalDatabaseModel.toEntity();
    expect(result, tTVLocalDatabase);
  });
}
