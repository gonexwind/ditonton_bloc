import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tSpokenLanguageModel = SpokenLanguageModel(
    englishName: 'englishName',
    iso6391: 'iso6391',
    name: 'name',
  );

  var tSpokenLanguage = SpokenLanguage(
    englishName: 'englishName',
    iso6391: 'iso6391',
    name: 'name',
  );

  test('should be a subclass of SpokenLanguage entity', () async {
    final result = tSpokenLanguageModel.toEntity();
    expect(result, tSpokenLanguage);
  });
}
