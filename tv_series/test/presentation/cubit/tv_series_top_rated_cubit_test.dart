import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';
import '../../dummy_data/dummy_objects.dart';
import 'tv_series_top_rated_cubit_test.mocks.dart';

@GenerateMocks([GetTopRatedTVSeries])
void main() {
  late TVSeriesTopRatedCubit cubit;
  late MockGetTopRatedTVSeries mockGetTopRatedTVSeries;

  setUp(() {
    mockGetTopRatedTVSeries = MockGetTopRatedTVSeries();
    cubit = TVSeriesTopRatedCubit(getTopRatedTVSeries: mockGetTopRatedTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  group(
    'TV Series Top Rated',
    () {
      final mockListTV = jsonListTopRatedTV
          .map((e) => TVModel.fromJson(e).toEntity())
          .toList();

      blocTest<TVSeriesTopRatedCubit, TVSeriesTopRatedState>(
        'should emitsInOrder [Loading, Loaded] when success',
        build: () {
          when(mockGetTopRatedTVSeries.execute())
              .thenAnswer((_) async => Right(mockListTV));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesTopRatedLoadingState(),
          TVSeriesTopRatedLoadedState(items: mockListTV),
        ],
      );

      blocTest<TVSeriesTopRatedCubit, TVSeriesTopRatedState>(
        'should emitsInOrder [Loading, Error] when unsuccessful',
        build: () {
          when(mockGetTopRatedTVSeries.execute())
              .thenAnswer((_) async => Left(ServerFailure('error')));
          return cubit;
        },
        act: (bloc) => bloc.get(),
        expect: () => [
          const TVSeriesTopRatedLoadingState(),
          const TVSeriesTopRatedErrorState('error'),
        ],
      );
    },
  );
}
