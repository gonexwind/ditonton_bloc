import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class SaveWatchlistTVSeries {
  final TVRepository repository;
  SaveWatchlistTVSeries({
    required this.repository,
  });

  Future<Either<Failure, String>> execute(TVDetail tv) {
    return repository.insertWatchlistTVSeries(tv);
  }
}
