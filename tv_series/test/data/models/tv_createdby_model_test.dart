import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tCreatedByModel = CreatedByModel(
    id: 19303,
    creditId: "52532e3219c29579400013ab",
    name: "Kevin Smith",
    gender: 2,
    profilePath: "/uxDQ0NTZMnOuAaPa0tQzMFV9dx4.jpg",
  );

  const tCreatedBy = CreatedBy(
    id: 19303,
    creditId: "52532e3219c29579400013ab",
    name: "Kevin Smith",
    gender: 2,
    profilePath: "/uxDQ0NTZMnOuAaPa0tQzMFV9dx4.jpg",
  );

  test('should be a subclass of CreatedBy entity', () async {
    final result = tCreatedByModel.toEntity();
    expect(result, tCreatedBy);
  });
}
