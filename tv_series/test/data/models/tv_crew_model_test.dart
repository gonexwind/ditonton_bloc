import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tCrewModel = CrewModel(
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
}
