import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';
import 'tv_series_watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlistTVSeries])
void main() {
  late TVSeriesWatchlistCubit cubit;
  late MockGetWatchlistTVSeries mockGetWatchlistTVSeries;

  setUp(() {
    mockGetWatchlistTVSeries = MockGetWatchlistTVSeries();
    cubit =
        TVSeriesWatchlistCubit(getWatchlistTVSeries: mockGetWatchlistTVSeries);
  });

  tearDown(() async {
    await cubit.close();
  });

  group('TV Series Watchlist', () {
    const List<TV>? listTV = [];

    blocTest<TVSeriesWatchlistCubit, TVSeriesWatchlistState>(
      'should emit [Loading, Loaded] when success',
      build: () {
        when(mockGetWatchlistTVSeries.execute())
            .thenAnswer((_) async => const Right(listTV));
        return cubit;
      },
      act: (bloc) => bloc.get(),
      expect: () => [
        const TVSeriesWatchlistLoadingState(),
        const TVSeriesWatchlistLoadedState(items: listTV),
      ],
    );

    blocTest<TVSeriesWatchlistCubit, TVSeriesWatchlistState>(
      'should emit [Loading, Error] when unsuccessful',
      build: () {
        when(mockGetWatchlistTVSeries.execute())
            .thenAnswer((_) async => Left(ServerFailure('error')));
        return cubit;
      },
      act: (bloc) => bloc.get(),
      expect: () => [
        const TVSeriesWatchlistLoadingState(),
        const TVSeriesWatchlistErrorState('error'),
      ],
    );
  });
}
