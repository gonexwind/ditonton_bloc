import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:tv_series/domain/usecases/remove_watchlist_tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late RemoveWatchlistTVSeries usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = RemoveWatchlistTVSeries(repository: repository);
  });

  test('should remove tv series from repository', () async {
    // arrange
    when(repository.removeWatchlistTVSeries(testTVDetail))
        .thenAnswer((_) async => Right('Removed from watchlist'));
    // act
    final result = await usecase.execute(testTVDetail);
    // assert
    expect(result, Right('Removed from watchlist'));
  });
}
