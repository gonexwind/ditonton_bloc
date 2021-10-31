import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/database_helper.dart';
import 'package:ditonton/data/models/tv/tv_local_database/tv_local_database_model.dart';

abstract class TVLocalDataSource {
  Future<String> insertWatchlist(TVLocalDatabaseModel tv);
  Future<String> removeWatchlist(TVLocalDatabaseModel tv);
  Future<TVLocalDatabaseModel?> getDataById(int id);
  Future<List<TVLocalDatabaseModel>> getWatchlist();
}

class TVLocalDataSourceImpl implements TVLocalDataSource {
  final DatabaseHelper databaseHelper;
  TVLocalDataSourceImpl({
    required this.databaseHelper,
  });

  @override
  Future<TVLocalDatabaseModel?> getDataById(int id) async {
    final result = await databaseHelper.getDataById(
      id: id,
      table: tblWatchlistTVSeries,
    );
    if (result != null) {
      return TVLocalDatabaseModel.fromJson(result);
    } else {
      return null;
    }
  }

  @override
  Future<List<TVLocalDatabaseModel>> getWatchlist() async {
    final result = await databaseHelper.getWatchlist(table: tblWatchlistTVSeries);
    return result.map((e) => TVLocalDatabaseModel.fromJson(e)).toList();
  }

  @override
  Future<String> insertWatchlist(TVLocalDatabaseModel tv) async {
    try {
      await databaseHelper.insertWatchlistTVSeries(tv);
      return 'Added to Watchlist';
    } on DatabaseException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> removeWatchlist(TVLocalDatabaseModel tv) async {
    try {
      await databaseHelper.removeWatchlist(id: tv.id, table: tblWatchlistTVSeries);
      return 'Removed from Watchlist';
    } on DatabaseException catch (e) {
      throw DatabaseException(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
