import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_watchlist_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetWatchlistTVSeries usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetWatchlistTVSeries(repository: repository);
  });

  final list = <TV>[];

  test(
    'should get watchlist from repository',
    () async {
      // arrange
      when(repository.getWatchlistTVSeries()).thenAnswer((realInvocation) async => Right(list));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(list));
    },
  );
}
