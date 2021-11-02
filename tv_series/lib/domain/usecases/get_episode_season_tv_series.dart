import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/domain/entities/tv_episode.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetEpisodeSeasonTVSeries {
  final TVRepository repository;

  GetEpisodeSeasonTVSeries({
    required this.repository,
  });
  Future<Either<Failure, List<Episode>>> execute({required int id, required int seasonNumber}) {
    return repository.getEpisodeSeasonTVSeries(
      id: id,
      seasonNumber: seasonNumber,
    );
  }
}
