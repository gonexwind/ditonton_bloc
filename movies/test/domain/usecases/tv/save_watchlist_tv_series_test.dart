import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/domain/usecases/tv/save_watchlist_tv_series.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late SaveWatchlistTVSeries usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = SaveWatchlistTVSeries(repository: repository);
  });

  test(
    'should save tv series to the repository',
    () async {
      // arrange
      when(repository.insertWatchlistTVSeries(testTVDetail))
          .thenAnswer((_) async => Right('Added to Watchlist'));
      // act
      final result = await usecase.execute(testTVDetail);
      log('result $result');
      // assert
      expect(result, Right('Added to Watchlist'));
    },
  );
}
