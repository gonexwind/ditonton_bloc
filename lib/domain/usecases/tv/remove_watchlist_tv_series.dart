import 'package:dartz/dartz.dart';

import 'package:ditonton/utils/failure.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/domain/repositories/tv_repository.dart';

class RemoveWatchlistTVSeries {
  final TVRepository repository;
  RemoveWatchlistTVSeries({
    required this.repository,
  });

  Future<Either<Failure, String>> execute(TVDetail tv) {
    return repository.removeWatchlistTVSeries(tv);
  }
}
