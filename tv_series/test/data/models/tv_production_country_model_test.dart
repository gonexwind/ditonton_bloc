import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tProductionCountryModel = ProductionCountryModel(
    iso31661: 'iso31661',
    name: 'name',
  );

  const tProductionCountry = ProductionCountry(
    iso31661: 'iso31661',
    name: 'name',
  );

  test('should be a subclass of ProductionCountry entity', () async {
    final result = tProductionCountryModel.toEntity();
    expect(result, tProductionCountry);
  });
}
