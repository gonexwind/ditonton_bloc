import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tNetworkModel = NetworkModel(
      name: "name",
      id: 1,
      logoPath: 'logoPath',
      originCountry: 'originCountry',
  );

  const tNetwork = Network(
    name: "name",
    id: 1,
    logoPath: 'logoPath',
    originCountry: 'originCountry',
  );

  test('should be a subclass of Network entity', () async {
    final result = tNetworkModel.toEntity();
    expect(result, tNetwork);
  });
}
