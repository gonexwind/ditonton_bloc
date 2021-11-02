import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/domain/entities/tv.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetTopRatedTVSeries {
  final TVRepository repository;
  GetTopRatedTVSeries({
    required this.repository,
  });
  Future<Either<Failure, List<TV>>> execute() {
    return repository.getTopRatedTVSeries();
  }
}
