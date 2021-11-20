import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/movies.dart';

import '../../dummy_data/dummy_objects.dart';
import 'movie_detail_cubit_test.mocks.dart';

@GenerateMocks([
  GetMovieDetail,
  GetWatchListStatus,
  SaveWatchlist,
  RemoveWatchlist,
])
void main() {
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;
  late MovieDetailCubit cubit;
  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    cubit = MovieDetailCubit(
      getMovieDetail: mockGetMovieDetail,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
      getWatchListStatus: mockGetWatchListStatus,
    );
  });

  tearDown(() async {
    await cubit.close();
  });

  const id = 1;

  group(
    'Movie Detail',
    () {
      test('state should be loading when first call', () async {
        /// arrange
        when(mockGetMovieDetail.execute(id))
            .thenAnswer((_) async => Right(testMovieDetail));

        /// act
        cubit.get(id);

        /// assert
        expect(cubit.state.requestState, RequestState.Loading);
      });

      test(
        'State should be loaded data when success',
        () async {
          /// arrange
          when(mockGetMovieDetail.execute(id))
              .thenAnswer((_) async => Right(testMovieDetail));

          /// act
          await cubit.get(id);

          /// assert
          expect(cubit.state.movie, testMovieDetail);
        },
      );

      test(
        'State should be error when unsuccessful',
        () async {
          /// arrange
          when(mockGetMovieDetail.execute(id))
              .thenAnswer((_) async => Left(ServerFailure('error')));

          /// act
          await cubit.get(id);

          /// assert
          expect(cubit.state.requestState, RequestState.Error);
        },
      );
    },
  );

  group(
    'Movie Detail Watchlist',
    () {
      test('should get watchlist status when function called', () async {
        /// arrange
        when(mockGetWatchListStatus.execute(id)).thenAnswer((_) async => true);

        /// act
        await cubit.getWatchlistStatus(id);

        /// assert
        expect(cubit.state.isAddedToWatchlist, true);
      });

      test(
        'should execute save watchlist when function called',
        () async {
          /// arrange
          when(mockSaveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => const Right('success insert'));
          when(mockGetWatchListStatus.execute(testMovieDetail.id))
              .thenAnswer((_) async => true);

          /// act
          await cubit.addWatchlist(testMovieDetail);

          /// assert
          expect(cubit.state.messageWatchlist, 'success insert');
          verify(mockSaveWatchlist.execute(testMovieDetail));
        },
      );

      test(
        'should update message watchlist when save function error',
        () async {
          /// arrange
          when(mockSaveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => Left(DatabaseFailure('error')));
          when(mockGetWatchListStatus.execute(testMovieDetail.id))
              .thenAnswer((_) async => true);

          /// act
          await cubit.addWatchlist(testMovieDetail);

          /// assert
          expect(cubit.state.messageWatchlist, 'error');
        },
      );

      test(
        'should execute save watchlist when function called',
        () async {
          /// arrange
          when(mockRemoveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => const Right('success remove'));
          when(mockGetWatchListStatus.execute(testMovieDetail.id))
              .thenAnswer((_) async => true);

          /// act
          await cubit.deleteWatchlist(testMovieDetail);

          /// assert
          expect(cubit.state.messageWatchlist, 'success remove');
          verify(mockRemoveWatchlist.execute(testMovieDetail));
        },
      );

      test(
        'should update message watchlist when remove function error',
        () async {
          /// arrange
          when(mockRemoveWatchlist.execute(testMovieDetail))
              .thenAnswer((_) async => Left(DatabaseFailure('error')));
          when(mockGetWatchListStatus.execute(testMovieDetail.id))
              .thenAnswer((_) async => true);

          /// act
          await cubit.deleteWatchlist(testMovieDetail);

          /// assert
          expect(cubit.state.messageWatchlist, 'error');
        },
      );
    },
  );
}
