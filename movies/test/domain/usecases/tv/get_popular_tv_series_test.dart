import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_popular_tv_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetPopularTVSeries usecase;
  setUp(() {
    repository = MockTVRepository();
    usecase = GetPopularTVSeries(repository: repository);
  });

  final list = <TV>[];

  test(
    'should get list of tv series from the repository',
    () async {
      // arrange
      when(repository.getPopularTVSeries()).thenAnswer((_) async => Right(list));
      // act
      final result = await usecase.execute();
      // assert
      expect(result, Right(list));
    },
  );
}
