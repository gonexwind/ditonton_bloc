import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tNetworkModelJson = {
    "name": "name",
    "id": 1,
    "logo_path": 'logoPath',
    "origin_country": 'originCountry',
  };

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

  test('should return NetworkModel object from json', () {
    final result = NetworkModel.fromJson(tNetworkModelJson);
    expect(result, tNetworkModel);
  });

  test('should return json object from NetworkModel', () {
    final result = tNetworkModel.toJson();
    expect(result, tNetworkModelJson);
  });
}
