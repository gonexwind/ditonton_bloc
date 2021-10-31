import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/tv_local_data_source.dart';
import 'package:ditonton/data/datasources/tv_remote_data_source.dart';
import 'package:ditonton/data/models/tv/tv_local_database/tv_local_database_model.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/entities/tv/tv_episode.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class TVRepositoryImpl implements TVRepository {
  final TVRemoteDataSource tvRemoteDataSource;
  final TVLocalDataSource tvLocalDataSource;
  const TVRepositoryImpl({
    required this.tvRemoteDataSource,
    required this.tvLocalDataSource,
  });

  @override
  Future<Either<Failure, List<TV>>> getAiringTodayTVSeries() async {
    try {
      final result = await tvRemoteDataSource.getAiringTodayTVSeries();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, TVDetail>> getDetailTVSeries(int id) async {
    try {
      final result = await tvRemoteDataSource.getDetailTVSeries(id);

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getPopularTVSeries() async {
    try {
      final result = await tvRemoteDataSource.getPopularTVSeries();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getTopRatedTVSeries() async {
    try {
      final result = await tvRemoteDataSource.getTopRatedTVSeries();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> searchTVSeries(String query) async {
    try {
      final result = await tvRemoteDataSource.searchTVSeries(query);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<TV>>> getRecommendationTVSeries(int id) async {
    try {
      final result = await tvRemoteDataSource.getRecommendationTVSeries(id);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Episode>>> getEpisodeSeasonTVSeries({
    required int id,
    required int seasonNumber,
  }) async {
    try {
      final result =
          await tvRemoteDataSource.getEpisodeSeasonTVSeries(id: id, seasonNumber: seasonNumber);
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  ///! START LOCAL DATASOURCE
  @override
  Future<Either<Failure, List<TV>>> getWatchlistTVSeries() async {
    try {
      final result = await tvLocalDataSource.getWatchlist();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, String>> insertWatchlistTVSeries(TVDetail tv) async {
    try {
      final result = await tvLocalDataSource.insertWatchlist(TVLocalDatabaseModel.fromEntity(tv));
      return Right(result);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  @override
  Future<bool> isAddedToWatchlistTVSeries(int id) async {
    final result = await tvLocalDataSource.getDataById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, String>> removeWatchlistTVSeries(TVDetail tv) async {
    try {
      final result = await tvLocalDataSource.removeWatchlist(TVLocalDatabaseModel.fromEntity(tv));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      return Left(CommonFailure('${e.toString()}'));
    }
  }

  ///! END LOCAL DATASOURCE

}
