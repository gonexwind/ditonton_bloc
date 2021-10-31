import 'package:dartz/dartz.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class GetWatchlistTVSeries {
  final TVRepository repository;
  GetWatchlistTVSeries({
    required this.repository,
  });

  Future<Either<Failure, List<TV>>> execute() {
    return repository.getWatchlistTVSeries();
  }
}
