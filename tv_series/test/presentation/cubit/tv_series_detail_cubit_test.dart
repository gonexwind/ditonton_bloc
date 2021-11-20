import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tv_series/tv_series.dart';

import '../../dummy_data/dummy_objects.dart';
import 'tv_series_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetDetailTVSeries,
  GetWatchListStatusTVSeries,
  SaveWatchlistTVSeries,
  RemoveWatchlistTVSeries,
])
void main() {
  late MockGetDetailTVSeries mockGetDetailTVSeries;
  late MockGetWatchListStatusTVSeries mockGetWatchListStatusTVSeries;
  late MockSaveWatchlistTVSeries mockSaveWatchlistTVSeries;
  late MockRemoveWatchlistTVSeries mockRemoveWatchlistTVSeries;

  late TVSeriesDetailCubit cubit;
  setUp(() {
    mockGetDetailTVSeries = MockGetDetailTVSeries();
    mockGetWatchListStatusTVSeries = MockGetWatchListStatusTVSeries();
    mockSaveWatchlistTVSeries = MockSaveWatchlistTVSeries();
    mockRemoveWatchlistTVSeries = MockRemoveWatchlistTVSeries();

    cubit = TVSeriesDetailCubit(
      getDetailTVSeries: mockGetDetailTVSeries,
      getWatchListStatusTVSeries: mockGetWatchListStatusTVSeries,
      saveWatchlistTVSeries: mockSaveWatchlistTVSeries,
      removeWatchlistTVSeries: mockRemoveWatchlistTVSeries,
    );
  });

  tearDown(() async {
    await cubit.close();
  });

  const int id = 1;

  final mockTVDetail = TVDetailResponse.fromJson(jsonDetailTV).toEntity();
  group(
    'TV Series Detail',
    () {
      test('state should be loading when first call', () async {
        /// arrange
        when(mockGetDetailTVSeries.execute(id)).thenAnswer((_) async => Right(mockTVDetail));

        /// act
        cubit.get(id);

        /// assert
        expect(cubit.state.requestState, RequestState.Loading);
      });
      test(
        'State should be loaded data when success',
        () async {
          /// arrange
          when(mockGetDetailTVSeries.execute(id)).thenAnswer((_) async => Right(mockTVDetail));

          /// act
          await cubit.get(id);

          /// assert
          expect(cubit.state.tv, mockTVDetail);
        },
      );

      test(
        'State should be error when unsuccessful',
        () async {
          /// arrange
          when(mockGetDetailTVSeries.execute(id))
              .thenAnswer((_) async => Left(ServerFailure('error')));

          /// act
          await cubit.get(id);

          /// assert
          expect(cubit.state.requestState, RequestState.Error);
        },
      );
    },
  );

  group('TV Series Watchlist', () {
    test('should get watchlist status when function called', () async {
      /// arrange
      when(mockGetWatchListStatusTVSeries.execute(id)).thenAnswer((_) async => true);

      /// act
      await cubit.getWatchlistStatus(id);

      /// assert
      expect(cubit.state.isAddedToWatchlist, true);
    });

    test(
      'should execute save watchlist when function called',
      () async {
        /// arrange
        when(mockSaveWatchlistTVSeries.execute(mockTVDetail))
            .thenAnswer((_) async => const Right('success insert'));
        when(mockGetWatchListStatusTVSeries.execute(mockTVDetail.id)).thenAnswer((_) async => true);

        /// act
        await cubit.saveWatchlist(mockTVDetail);

        /// assert
        expect(cubit.state.messageWatchlist, 'success insert');
        verify(mockSaveWatchlistTVSeries.execute(mockTVDetail));
      },
    );

    test(
      'should update message watchlist when save function error',
      () async {
        /// arrange
        when(mockSaveWatchlistTVSeries.execute(mockTVDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('error')));
        when(mockGetWatchListStatusTVSeries.execute(mockTVDetail.id)).thenAnswer((_) async => true);

        /// act
        await cubit.saveWatchlist(mockTVDetail);

        /// assert
        expect(cubit.state.messageWatchlist, 'error');
      },
    );

    test(
      'should execute save watchlist when function called',
      () async {
        /// arrange
        when(mockRemoveWatchlistTVSeries.execute(mockTVDetail))
            .thenAnswer((_) async => const Right('success remove'));
        when(mockGetWatchListStatusTVSeries.execute(mockTVDetail.id)).thenAnswer((_) async => true);

        /// act
        await cubit.removeWatchlist(mockTVDetail);

        /// assert
        expect(cubit.state.messageWatchlist, 'success remove');
        verify(mockRemoveWatchlistTVSeries.execute(mockTVDetail));
      },
    );

    test(
      'should update message watchlist when remove function error',
      () async {
        /// arrange
        when(mockRemoveWatchlistTVSeries.execute(mockTVDetail))
            .thenAnswer((_) async => Left(DatabaseFailure('error')));
        when(mockGetWatchListStatusTVSeries.execute(mockTVDetail.id)).thenAnswer((_) async => true);

        /// act
        await cubit.removeWatchlist(mockTVDetail);

        /// assert
        expect(cubit.state.messageWatchlist, 'error');
      },
    );
  });
}
