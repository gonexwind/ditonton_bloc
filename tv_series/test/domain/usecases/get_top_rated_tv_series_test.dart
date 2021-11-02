import 'package:dartz/dartz.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/usecases/get_top_rated_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetTopRatedTVSeries usecase;

  setUp(() {
    repository = MockTVRepository();
    usecase = GetTopRatedTVSeries(repository: repository);
  });

  final list = <TV>[];

  test(
    'should get list of tv series from repository',
    () async {
      // arrange
      when(repository.getTopRatedTVSeries()).thenAnswer((_) async => Right(list));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(list));
    },
  );
}
