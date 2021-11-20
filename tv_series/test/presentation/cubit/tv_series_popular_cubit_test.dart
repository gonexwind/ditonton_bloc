import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_popular_cubit_test.mocks.dart';

@GenerateMocks([GetPopularTVSeries])
void main() {
  late MockGetPopularTVSeries mockGetPopularTVSeries;
  late TVSeriesPopularCubit cubit;
  setUp(
    () {
      mockGetPopularTVSeries = MockGetPopularTVSeries();
      cubit = TVSeriesPopularCubit(getPopularTVSeries: mockGetPopularTVSeries);
    },
  );

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series Popular',
    () {
      final mockListTV = jsonListSearchTV
          .map(
            (e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map))
                .toEntity(),
          )
          .toList();

      blocTest<TVSeriesPopularCubit, TVSeriesPopularState>(
        'should emitsInOrder [Loading, Loaded] when successfull',
        build: () {
          when(mockGetPopularTVSeries.execute())
              .thenAnswer((_) async => Right(mockListTV));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesPopularLoadingState(),
          TVSeriesPopularLoadedState(items: mockListTV),
        ],
      );

      blocTest<TVSeriesPopularCubit, TVSeriesPopularState>(
        'should emitsInOrder [Loading, Error] when unsuccessfull',
        build: () {
          when(mockGetPopularTVSeries.execute())
              .thenAnswer((_) async => Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesPopularLoadingState(),
          const TVSeriesPopularErrorState('error'),
        ],
      );
    },
  );
}
