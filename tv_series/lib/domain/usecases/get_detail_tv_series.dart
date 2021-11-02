import 'package:dartz/dartz.dart';
import 'package:core/utils/failure.dart';
import 'package:tv_series/domain/entities/tv_detail.dart';
import 'package:tv_series/domain/repositories/tv_repository.dart';

class GetDetailTVSeries {
  final TVRepository repository;
  GetDetailTVSeries({
    required this.repository,
  });

  Future<Either<Failure, TVDetail>> execute(int id) {
    return repository.getDetailTVSeries(id);
  }
}
