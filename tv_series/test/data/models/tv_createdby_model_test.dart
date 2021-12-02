import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tCreatedByModelJson = {
    "id": 1,
    "credit_id": "creditId",
    "name": "name",
    "gender": 2,
    "profile_path": "profilePath",
  };

  const tCreatedByModel = CreatedByModel(
    id: 1,
    creditId: "creditId",
    name: "name",
    gender: 2,
    profilePath: "profilePath",
  );

  const tCreatedBy = CreatedBy(
    id: 1,
    creditId: "creditId",
    name: "name",
    gender: 2,
    profilePath: "profilePath",
  );

  test('should be a subclass of CreatedBy entity', () async {
    final result = tCreatedByModel.toEntity();
    expect(result, tCreatedBy);
  });

  test('should return CreatedByModel object from json', () {
    final result = CreatedByModel.fromJson(tCreatedByModelJson);
    expect(result, tCreatedByModel);
  });

  test('should return json object from CreatedByModel', () {
    final result = tCreatedByModel.toJson();
    expect(result, tCreatedByModelJson);
  });
}
