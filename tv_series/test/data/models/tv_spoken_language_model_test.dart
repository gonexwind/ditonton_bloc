import 'package:flutter_test/flutter_test.dart';
import 'package:tv_series/tv_series.dart';

void main() {
  var tSpokenLanguageModelJson = {
    "english_name": 'englishName',
    'iso6391': 'iso6391',
    'name': 'name',
  };

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

  test('should return SpokenLanguageModel object from json', () {
    final result = SpokenLanguageModel.fromJson(tSpokenLanguageModelJson);
    expect(result, tSpokenLanguageModel);
  });

  test('should return json object from SpokenLanguageModel', () {
    final result = tSpokenLanguageModel.toJson();
    expect(result, tSpokenLanguageModelJson);
  });
}
