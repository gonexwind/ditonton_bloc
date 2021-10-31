import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/entities/tv/tv_episode.dart';

abstract class TVRepository {
  /// API Resource
  Future<Either<Failure, List<TV>>> getAiringTodayTVSeries();
  Future<Either<Failure, List<TV>>> getPopularTVSeries();
  Future<Either<Failure, List<TV>>> getTopRatedTVSeries();
  Future<Either<Failure, List<TV>>> getRecommendationTVSeries(int id);
  Future<Either<Failure, TVDetail>> getDetailTVSeries(int id);
  Future<Either<Failure, List<TV>>> searchTVSeries(String query);
  Future<Either<Failure, List<Episode>>> getEpisodeSeasonTVSeries({
    required int id,
    required int seasonNumber,
  });

  /// Local Database Resource
  Future<Either<Failure, String>> insertWatchlistTVSeries(TVDetail tv);
  Future<Either<Failure, String>> removeWatchlistTVSeries(TVDetail tv);
  Future<bool> isAddedToWatchlistTVSeries(int id);
  Future<Either<Failure, List<TV>>> getWatchlistTVSeries();
}
