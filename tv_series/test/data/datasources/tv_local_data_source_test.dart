import 'package:core/utils/constants.dart';
import 'package:core/utils/exception.dart';
import 'package:tv_series/data/datasources/tv_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late TVLocalDataSourceImpl dataSource;
  late MockDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockDatabaseHelper();
    dataSource = TVLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('get watchlist TV Series', () {
    test(
      'should return list of TVLocalDatabaseModel from database',
      () async {
        // arrange
        when(mockDatabaseHelper.getWatchlist(table: tblWatchlistTVSeries))
            .thenAnswer((_) async => [testTVSeriesMap]);
        // act
        final result = await dataSource.getWatchlist();
        // assert
        expect(result, [testTVSeriesTable]);
      },
    );
  });

  group('save watchlist TV Series', () {
    test(
      'should return success message when insert watchlist is success',
      () async {
        // arrange
        when(mockDatabaseHelper.insertWatchlistTVSeries(testTVSeriesTable))
            .thenAnswer((_) async => 1);
        // act
        final result = await dataSource.insertWatchlist(testTVSeriesTable);
        // assert
        expect(result, 'Added to Watchlist');
      },
    );

    test('should throw DatabaseException when insert to database is failed', () async {
      //arrange
      when(mockDatabaseHelper.insertWatchlistTVSeries(testTVSeriesTable))
          .thenThrow(DatabaseException('error'));
      // act
      final call = dataSource.insertWatchlist(testTVSeriesTable);
      // assert
      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('remove watchlist TV Series', () {
    test('should return success message when remove from watchlist success', () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(
        id: testTVSeriesTable.id,
        table: tblWatchlistTVSeries,
      )).thenAnswer((realInvocation) async => 1);
      // act
      final result = await dataSource.removeWatchlist(testTVSeriesTable);
      // assert
      expect(result, 'Removed from Watchlist');
    });

    test('should throw DatabaseException when remove from watchlist is failed', () async {
      // arrange
      when(mockDatabaseHelper.removeWatchlist(
        id: testTVSeriesTable.id,
        table: tblWatchlistTVSeries,
      )).thenThrow(DatabaseException('error'));
      // act
      final result = dataSource.removeWatchlist(testTVSeriesTable);
      // assert
      expect(result, throwsA(isA<DatabaseException>()));
    });
  });

  group('Get TV Series Detail By Id', () {
    final tId = 1;

    test('should return TV Series Table when data is found', () async {
      // arrange
      when(mockDatabaseHelper.getDataById(
        id: tId,
        table: tblWatchlistTVSeries,
      )).thenAnswer((_) async => testTVSeriesMap);
      // act
      final result = await dataSource.getDataById(tId);
      // assert
      expect(result, testTVSeriesTable);
    });

    test('should return null when data is not found', () async {
      // arrange
      when(mockDatabaseHelper.getDataById(
        id: tId,
        table: tblWatchlistTVSeries,
      )).thenAnswer((_) async => null);
      // act
      final result = await dataSource.getDataById(tId);
      // assert
      expect(result, null);
    });
  });
}
