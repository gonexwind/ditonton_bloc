import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tTVLocalDatabaseModelJson = {
    "id": 1,
    "title": 'title',
    "posterPath": 'posterPath',
    "overview": 'overview',
  };

  var tTVLocalDatabaseModel = TVLocalDatabaseModel(
    id: 1,
    title: 'title',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  var tTVLocalDatabase = TV(
    id: 1,
    name: 'title',
    posterPath: 'posterPath',
    overview: 'overview',
  );

  test('should be a subclass of TVLocalDatabase entity', () async {
    final result = tTVLocalDatabaseModel.toEntity();
    expect(result, tTVLocalDatabase);
  });

  test('should return TVLocalDatabaseModel object from json', () {
    final result = TVLocalDatabaseModel.fromJson(tTVLocalDatabaseModelJson);
    expect(result, tTVLocalDatabaseModel);
  });

  test('should return json object from TVLocalDatabaseModel', () {
    final result = tTVLocalDatabaseModel.toJson();
    expect(result, tTVLocalDatabaseModelJson);
  });
}
