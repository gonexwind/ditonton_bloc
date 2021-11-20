import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_recommendations_cubit_test.mocks.dart';

@GenerateMocks([GetRecommendationTVSeries])
void main() {
  late TVSeriesRecommendationsCubit cubit;
  late MockGetRecommendationTVSeries mockGetRecommendationTVSeries;

  setUp(() {
    mockGetRecommendationTVSeries = MockGetRecommendationTVSeries();
    cubit = TVSeriesRecommendationsCubit(
        getRecommendationTVSeries: mockGetRecommendationTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series Recommendations ',
    () {
      final mockTVDetail = TVDetailResponse.fromJson(jsonDetailTV).toEntity();
      final mockListTV = jsonListRecommendationTV
          .map((e) => TVModel.fromJson(e).toEntity())
          .toList();
      blocTest<TVSeriesRecommendationsCubit, TVSeriesRecommendationsState>(
        'should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetRecommendationTVSeries.execute(mockTVDetail.id))
              .thenAnswer((_) async => Right(mockListTV));
          return cubit;
        },
        act: (bloc) => bloc.get(mockTVDetail.id),
        expect: () => [
          const TVSeriesRecommendationsLoadingState(),
          TVSeriesRecommendationsLoadedState(items: mockListTV),
        ],
      );

      blocTest<TVSeriesRecommendationsCubit, TVSeriesRecommendationsState>(
        'should emitsInOrder [Loading, Error] when unsuccess',
        build: () {
          when(mockGetRecommendationTVSeries.execute(mockTVDetail.id))
              .thenAnswer((_) async => Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(mockTVDetail.id),
        expect: () => [
          const TVSeriesRecommendationsLoadingState(),
          const TVSeriesRecommendationsErrorState('error'),
        ],
      );
    },
  );
}
