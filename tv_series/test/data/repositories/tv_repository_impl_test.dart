import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:core/utils/exception.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/data/models/tv_detail_model.dart';
import 'package:tv_series/data/models/tv_episode_model.dart';
import 'package:tv_series/data/models/tv_model.dart';
import 'package:tv_series/data/repositories/tv_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';
import '../../json_reader.dart';

void main() {
  late TVRepositoryImpl repository;
  late MockTVRemoteDataSource mockTVRemoteDataSource;
  late MockTVLocalDataSource mockTVLocalDataSource;

  setUp(() {
    mockTVRemoteDataSource = MockTVRemoteDataSource();
    mockTVLocalDataSource = MockTVLocalDataSource();
    repository = TVRepositoryImpl(
      tvRemoteDataSource: mockTVRemoteDataSource,
      tvLocalDataSource: mockTVLocalDataSource,
    );
  });

  const id = 61663;
  const seasonNumber = 1;
  const query = 'your lie in april';

  final tvModelList =
      jsonListSearchTV.map((e) => TVModel.fromJson(Map<String, dynamic>.from(e as Map))).toList();
  final tvModel = tvModelList.first;

  final tv = tvModel.toEntity();
  final tvList = [tv];

  final tvDetailRespon =
      TVDetailResponse.fromJson(jsonDecode(readJson('dummy_data/tv_detail.json')));
  final tvDetail = tvDetailRespon.toEntity();

  final tvEpisodeSeasonList = jsonListEpisodeSeasonTV
      .map((e) => EpisodeModel.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();

  group('Airing Today TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.getAiringTodayTVSeries()).thenAnswer((_) async => tvModelList);
        // act
        final result = await repository.getAiringTodayTVSeries();
        // assert
        verify(mockTVRemoteDataSource.getAiringTodayTVSeries());
        final list = result.getOrElse(() => []);
        expect(list, tvList);
      },
    );

    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getAiringTodayTVSeries()).thenThrow(ServerException());
      // act
      final result = await repository.getAiringTodayTVSeries();
      // assert
      verify(mockTVRemoteDataSource.getAiringTodayTVSeries());
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Popular TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.getPopularTVSeries()).thenAnswer((_) async => tvModelList);
        // act
        final result = await repository.getPopularTVSeries();
        // assert
        verify(mockTVRemoteDataSource.getPopularTVSeries());
        final list = result.getOrElse(() => []);
        expect(list, tvList);
      },
    );

    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getPopularTVSeries()).thenThrow(ServerException());
      // act
      final result = await repository.getPopularTVSeries();
      // assert
      verify(mockTVRemoteDataSource.getPopularTVSeries());
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Top Rated TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.getTopRatedTVSeries()).thenAnswer((_) async => tvModelList);
        // act
        final result = await repository.getTopRatedTVSeries();
        // assert
        verify(mockTVRemoteDataSource.getTopRatedTVSeries());
        final list = result.getOrElse(() => []);
        expect(list, tvList);
      },
    );

    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getTopRatedTVSeries()).thenThrow(ServerException());
      // act
      final result = await repository.getTopRatedTVSeries();
      // assert
      verify(mockTVRemoteDataSource.getTopRatedTVSeries());
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Detail TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.getDetailTVSeries(id)).thenAnswer((_) async => tvDetailRespon);
        // act
        final result = await repository.getDetailTVSeries(id);
        // assert
        verify(mockTVRemoteDataSource.getDetailTVSeries(id));
        expect(result, equals(Right(tvDetail)));
      },
    );
    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getDetailTVSeries(id)).thenThrow(ServerException());
      // act
      final result = await repository.getDetailTVSeries(id);
      // assert
      verify(mockTVRemoteDataSource.getDetailTVSeries(id));
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Search TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.searchTVSeries(query)).thenAnswer((_) async => tvModelList);
        // act
        final result = await repository.searchTVSeries(query);
        // assert
        verify(mockTVRemoteDataSource.searchTVSeries(query));
        final list = result.getOrElse(() => []);
        expect(list, tvList);
      },
    );

    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.searchTVSeries(query)).thenThrow(ServerException());
      // act
      final result = await repository.searchTVSeries(query);
      // assert
      verify(mockTVRemoteDataSource.searchTVSeries(query));
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Recommendation TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.getRecommendationTVSeries(id))
            .thenAnswer((_) async => tvModelList);
        // act
        final result = await repository.getRecommendationTVSeries(id);
        // assert
        verify(mockTVRemoteDataSource.getRecommendationTVSeries(id));
        final list = result.getOrElse(() => []);
        expect(list, tvList);
      },
    );

    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getRecommendationTVSeries(id)).thenThrow(ServerException());
      // act
      final result = await repository.getRecommendationTVSeries(id);
      // assert
      verify(mockTVRemoteDataSource.getRecommendationTVSeries(id));
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Episode of season TV Series', () {
    test(
      'should return remote data when the call to remote data source is success',
      () async {
        // arrange
        when(mockTVRemoteDataSource.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber))
            .thenAnswer((_) async => tvEpisodeSeasonList);
        // act
        final result =
            await repository.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber);
        // assert
        verify(mockTVRemoteDataSource.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber));
        final list = result.getOrElse(() => []);
        final toEntity = tvEpisodeSeasonList.map((e) => e.toEntity()).toList();
        expect(list, toEntity);
      },
    );

    test('should return server failure when the call to remote data source is unsuccessful',
        () async {
      // arrange
      when(mockTVRemoteDataSource.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber))
          .thenThrow(ServerException());
      // act
      final result = await repository.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber);
      // assert
      verify(mockTVRemoteDataSource.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber));
      expect(result, equals(Left(ServerFailure(''))));
    });
  });

  group('Watchlist TV Series', () {
    test('should return list of TV Series', () async {
      // arrange
      when(mockTVLocalDataSource.getWatchlist()).thenAnswer((_) async => [testTVSeriesTable]);
      // act
      final result = await repository.getWatchlistTVSeries();
      // assert
      final list = result.getOrElse(() => []);
      expect(list, [testTVSeriesTable.toEntity()]);
    });
  });

  group('save tv series', () {
    test(
      'should throw Database Failure when save unsuccessful',
      () async {
        // arrange
        when(mockTVLocalDataSource.insertWatchlist(testTVSeriesTable))
            .thenAnswer((_) async => 'Added to Watchlist');
        // act
        final result = await repository.insertWatchlistTVSeries(testTVDetail);
        log('result $result');
        // assert
        expect(result, Right('Added to Watchlist'));
      },
    );

    test('should return DatabaseFailure when saving unsuccessful', () async {
      // arrange
      when(mockTVLocalDataSource.insertWatchlist(testTVSeriesTable))
          .thenThrow(DatabaseException('Failed to add watchlist'));
      // act
      final result = await repository.insertWatchlistTVSeries(testTVDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('remove tv series', () {
    test('should return success message when remove successful', () async {
      // arrange
      when(mockTVLocalDataSource.removeWatchlist(testTVSeriesTable))
          .thenAnswer((_) async => 'Removed from watchlist');
      // act
      final result = await repository.removeWatchlistTVSeries(testTVDetail);
      // assert
      expect(result, Right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      // arrange
      when(mockTVLocalDataSource.removeWatchlist(testTVSeriesTable))
          .thenThrow(DatabaseException('Failed to remove watchlist'));
      // act
      final result = await repository.removeWatchlistTVSeries(testTVDetail);
      // assert
      expect(result, Left(DatabaseFailure('Failed to remove watchlist')));
    });
  });

  group('get watchlist status', () {
    test('should return watch status whether data is found', () async {
      // arrange
      final tId = 1;
      when(mockTVLocalDataSource.getDataById(tId)).thenAnswer((_) async => null);
      // act
      final result = await repository.isAddedToWatchlistTVSeries(tId);
      // assert
      expect(result, false);
    });
  });
}
