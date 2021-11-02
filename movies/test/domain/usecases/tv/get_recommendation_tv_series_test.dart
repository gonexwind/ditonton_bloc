import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/usecases/tv/get_recommendation_tv_series.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTVRepository repository;
  late GetRecommendationTVSeries usecase;

  setUp(() async {
    repository = MockTVRepository();
    usecase = GetRecommendationTVSeries(repository: repository);
  });

  const id = 1;
  const list = <TV>[];

  test(
    'should get list of tv series from repository',
    () async {
      // arrange
      when(repository.getRecommendationTVSeries(id)).thenAnswer((_) async => Right(list));
      // act
      final result = await usecase.execute(id);
      // assert
      expect(result, Right(list));
    },
  );
}
