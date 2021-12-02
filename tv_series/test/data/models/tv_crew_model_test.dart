import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  const tCrewModelJson = {
    "id": 169061,
    "job": "Writer",
    "department": "Writing",
    "person_id": "personId",
    "credit_id": "5918e7fcc3a368426904f62f",
    "adult": false,
    "gender": 2,
    "known_for_department": "Writing",
    "name": "David Shore",
    "original_name": "David Shore",
    "popularity": 1.409,
    "profile_path": "/yUwAL9wOJoS9caz9GusyHsrad8J.jpg",
    "character": "character",
    "order": 1,
  };

  const tCrewModel = CrewModel(
    id: 169061,
    job: "Writer",
    department: "Writing",
    personId: "personId",
    creditId: "5918e7fcc3a368426904f62f",
    adult: false,
    gender: 2,
    knownForDepartment: "Writing",
    name: "David Shore",
    originalName: "David Shore",
    popularity: 1.409,
    profilePath: "/yUwAL9wOJoS9caz9GusyHsrad8J.jpg",
    character: "character",
    order: 1,
  );

  const tCrew = Crew(
    id: 169061,
    job: "Writer",
    department: "Writing",
    personId: "personId",
    creditId: "5918e7fcc3a368426904f62f",
    adult: false,
    gender: 2,
    knownForDepartment: "Writing",
    name: "David Shore",
    originalName: "David Shore",
    popularity: 1.409,
    profilePath: "/yUwAL9wOJoS9caz9GusyHsrad8J.jpg",
    character: "character",
    order: 1,
  );

  test('should be a subclass of Crew entity', () async {
    final result = tCrewModel.toEntity();
    expect(result, tCrew);
  });

  test('should return CrewModel object from json', () {
    final result = CrewModel.fromJson(tCrewModelJson);
    expect(result, tCrewModel);
  });

  test('should return json object from CrewModel', () {
    final result = tCrewModel.toJson();
    expect(result, tCrewModelJson);
  });
}
